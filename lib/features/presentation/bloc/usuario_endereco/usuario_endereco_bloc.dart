import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_endereco_dto.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/delete_usuario_endereco/delete_usuario_endereco.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/get_usuario_endereco/get_usuario_endereco.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/get_usuario_endereco/get_usuario_endereco_imp.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/save_usuario_endereco/save_usuario_endereco.dart';

part 'usuario_endereco_event.dart';
part 'usuario_endereco_state.dart';

sealed class IUsuarioEnderecoBloc
    extends Bloc<IUsuarioEnderecoEvent, IUsuarioEnderecoState> {
  late final IGetUsuarioEndereco _usuarioEndereco;
  IUsuarioEnderecoBloc(super.initialState) {
    _usuarioEndereco = GetUsuarioEnderecoImp();
    on<GetUsuarioEnderecoEvent>(_getUsuarioEndereco);
    on<AdicionarEnderecoEvent>(_adicionarEndereco);
    on<DeletarEnderecoEvent>(_deletarEndereco);
  }

  void _getUsuarioEndereco(
      IUsuarioEnderecoEvent event, Emitter<IUsuarioEnderecoState> emit);

  void _adicionarEndereco(
      AdicionarEnderecoEvent event, Emitter<IUsuarioEnderecoState> emit);

  void _deletarEndereco(
      DeletarEnderecoEvent event, Emitter<IUsuarioEnderecoState> emit);
}

final class UsuarioEnderecoBloc extends IUsuarioEnderecoBloc {
  UsuarioEnderecoBloc() : super(InitialUsuarioEnderecoState());

  @override
  void _adicionarEndereco(
      AdicionarEnderecoEvent event, Emitter<IUsuarioEnderecoState> emit) async {
    try {
      await getIt<ISaveUsuarioEndereco>()
          .saveUsuarioEndereco(
        usuarioEndereco: event.usuarioEndereco,
        bearer: event.bearer ?? 'null',
      )
          .then(
        (value) {
          emit(InitialUsuarioEnderecoState());
          ScaffoldMessenger.of(event.context).showSnackBar(
            const SnackBar(
              content: Text(
                'Endereço adicionado com sucesso',
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ).whenComplete(() async {
        final endereco = await _usuarioEndereco.getUsuarioEndereco(
            idUsuario: event.idUsuario ?? 'null',
            bearer: event.bearer ?? 'null');
        emit(LoadedUsuarioEnderecoState(endereco));
        if (endereco.isEmpty) {
          emit(EmptyUsuarioEnderecoState());
        }
      });
    } on CatchError catch (e) {
      emit(ErrorUsuarioEnderecoState(e.message));
    }
  }

  @override
  void _deletarEndereco(
      DeletarEnderecoEvent event, Emitter<IUsuarioEnderecoState> emit) async {
    await getIt<IDeleteUsuarioEndereco>()
        .deleteUsuarioEndereco(
            idEndereco: event.id, bearer: event.bearer ?? 'null')
        .then((value) {
      emit(InitialUsuarioEnderecoState());
      ScaffoldMessenger.of(event.context).showSnackBar(
        const SnackBar(
          content: Text(
            'Endereço deletado com sucesso',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }).whenComplete(() async {
      final endereco = await _usuarioEndereco.getUsuarioEndereco(
          idUsuario: event.idUsuario ?? 'null', bearer: event.bearer ?? 'null');
      emit(LoadedUsuarioEnderecoState(endereco));
      if (endereco.isEmpty) {
        emit(EmptyUsuarioEnderecoState());
      }
    });
  }

  @override
  void _getUsuarioEndereco(
      IUsuarioEnderecoEvent event, Emitter<IUsuarioEnderecoState> emit) async {
    try {
      emit(InitialUsuarioEnderecoState());
      final endereco = await _usuarioEndereco.getUsuarioEndereco(
          idUsuario: event.idUsuario ?? 'null', bearer: event.bearer ?? 'null');
      emit(LoadedUsuarioEnderecoState(endereco));
      if (endereco.isEmpty) {
        emit(EmptyUsuarioEnderecoState());
      }
    } on CatchError catch (e) {
      emit(ErrorUsuarioEnderecoState(e.message));
    }
  }
}
