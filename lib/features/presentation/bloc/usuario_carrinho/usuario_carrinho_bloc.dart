import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';

part 'usuario_carrinho_event.dart';
part 'usuario_carrinho_state.dart';

sealed class IUsuarioCarrinhoBloc
    extends Bloc<IUsuarioCarrinhoEvent, IUsuarioCarrinhoState> {
  IUsuarioCarrinhoBloc(super.initialState) {
    on<AdicionarProdutoCarrinhoEvent>(_dicionarProdutoCarrinhoEvent);
  }

  _dicionarProdutoCarrinhoEvent(
      IUsuarioCarrinhoEvent event, Emitter<IUsuarioCarrinhoState> emit);
}

final class UsuarioCarrinhoBloc extends IUsuarioCarrinhoBloc {
  UsuarioCarrinhoBloc() : super(InitialUsuarioCarrinhoState());

  @override
  _dicionarProdutoCarrinhoEvent(
      IUsuarioCarrinhoEvent event, Emitter<IUsuarioCarrinhoState> emit) {}
}
