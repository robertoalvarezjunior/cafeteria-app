import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_carrinho_dto.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/add_item_carrinho/add_item_carrinho.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/delete_item_carrinho/delete_item_carrinho.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/get_usuario_carrinho/get_usuario_carrinho.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/get_usuario_carrinho/get_usuario_carrinho_imp.dart';

part 'usuario_carrinho_event.dart';
part 'usuario_carrinho_state.dart';

sealed class IUsuarioCarrinhoBloc
    extends Bloc<IUsuarioCarrinhoEvent, IUsuarioCarrinhoState> {
  late final IGetUsuarioCarrinho _getUsuarioCarrinho;
  IUsuarioCarrinhoBloc(super.initialState) {
    _getUsuarioCarrinho = GetUsuarioCarrinhoImp();
    on<AdicionarProdutoCarrinhoEvent>(_dicionarProdutoCarrinhoEvent);
    on<GetUsuarioCarrinhoEvent>(_getUsuarioCarrinhoEvent);
    on<DeletarProdutoCarrinhoEvent>(_deletarProdutoCarrinhoEvent);
  }

  void _dicionarProdutoCarrinhoEvent(
      AdicionarProdutoCarrinhoEvent event, Emitter<IUsuarioCarrinhoState> emit);

  void _getUsuarioCarrinhoEvent(
      IUsuarioCarrinhoEvent event, Emitter<IUsuarioCarrinhoState> emit);

  void _deletarProdutoCarrinhoEvent(
      DeletarProdutoCarrinhoEvent event, Emitter<IUsuarioCarrinhoState> emit);
}

final class UsuarioCarrinhoBloc extends IUsuarioCarrinhoBloc {
  UsuarioCarrinhoBloc() : super(InitialUsuarioCarrinhoState());

  @override
  _dicionarProdutoCarrinhoEvent(AdicionarProdutoCarrinhoEvent event,
      Emitter<IUsuarioCarrinhoState> emit) {
    try {
      getIt<IAddItemCarrinho>()
          .saveUsuarioCarrinho(
              usuarioCarrinho: event.usuarioCarrinho,
              bearer: event.bearer ?? 'null')
          .then(
            (value) => ScaffoldMessenger.of(event.context).showSnackBar(
              SnackBar(
                content: Text(
                  value,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
    } on CatchError catch (e) {
      emit(ErrorUsuarioCarrinhoState(e.message));
    }
  }

  @override
  void _getUsuarioCarrinhoEvent(
      IUsuarioCarrinhoEvent event, Emitter<IUsuarioCarrinhoState> emit) async {
    try {
      emit(InitialUsuarioCarrinhoState());
      final carrinho = await _getUsuarioCarrinho.getUsuarioCarrinho(
          idUsuario: event.idUsuario ?? 'null', bearer: event.bearer ?? 'null');
      emit(LoadedUsuarioCarrinhoState(carrinho));
      if (carrinho.isEmpty) {
        emit(EmptyUsuarioCarrinhoState());
      }
    } on CatchError catch (e) {
      emit(ErrorUsuarioCarrinhoState(e.message));
    }
  }

  @override
  void _deletarProdutoCarrinhoEvent(DeletarProdutoCarrinhoEvent event,
      Emitter<IUsuarioCarrinhoState> emit) async {
    await getIt<IDeleteItemCarrinho>()
        .deleteItemCarrinho(id: event.id, bearer: event.bearer ?? 'null')
        .then(
      (value) {
        emit(InitialUsuarioCarrinhoState());
        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(
            content: Text(
              value,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    ).whenComplete(() async {
      final carrinho = await _getUsuarioCarrinho.getUsuarioCarrinho(
          idUsuario: event.idUsuario ?? 'null', bearer: event.bearer ?? 'null');
      emit(LoadedUsuarioCarrinhoState(carrinho));
      if (carrinho.isEmpty) {
        emit(EmptyUsuarioCarrinhoState());
      }
    }).catchError((e) {
      emit(ErrorUsuarioCarrinhoState(e.message));
    });
  }
}
