part of 'usuario_carrinho_bloc.dart';

sealed class IUsuarioCarrinhoState extends Equatable {
  const IUsuarioCarrinhoState();
  @override
  List<Object?> get props => [];
}

final class InitialUsuarioCarrinhoState extends IUsuarioCarrinhoState {}

final class EmptyUsuarioCarrinhoState extends IUsuarioCarrinhoState {}

final class ErrorUsuarioCarrinhoState extends IUsuarioCarrinhoState {
  final String message;

  const ErrorUsuarioCarrinhoState(this.message);
}

final class LoadedUsuarioCarrinhoState extends IUsuarioCarrinhoState {
  final List<UsuarioCarrinhoEntity> carrinho;
  const LoadedUsuarioCarrinhoState(this.carrinho);
}
