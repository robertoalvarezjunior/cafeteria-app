part of 'usuario_carrinho_bloc.dart';

sealed class IUsuarioCarrinhoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GetUsuarioCarrinhoEvent extends IUsuarioCarrinhoEvent {}

final class AdicionarProdutoCarrinhoEvent extends IUsuarioCarrinhoEvent {}

final class DeletarProdutoCarrinhoEvent extends IUsuarioCarrinhoEvent {}

final class AtualizarQuantidadeProdutoCarrinhoEvent
    extends IUsuarioCarrinhoEvent {}
