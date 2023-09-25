part of 'usuario_carrinho_bloc.dart';

sealed class IUsuarioCarrinhoEvent extends Equatable {
  const IUsuarioCarrinhoEvent({this.idUsuario, this.bearer});
  final String? idUsuario;
  final String? bearer;
  @override
  List<Object?> get props => [];
}

final class GetUsuarioCarrinhoEvent extends IUsuarioCarrinhoEvent {
  const GetUsuarioCarrinhoEvent({super.idUsuario, super.bearer});
}

final class AdicionarProdutoCarrinhoEvent extends IUsuarioCarrinhoEvent {
  final UsuarioCarrinhoDto usuarioCarrinho;
  final BuildContext context;
  const AdicionarProdutoCarrinhoEvent(
      {super.idUsuario,
      super.bearer,
      required this.usuarioCarrinho,
      required this.context});
}

final class DeletarProdutoCarrinhoEvent extends IUsuarioCarrinhoEvent {
  final BuildContext context;
  final String id;
  const DeletarProdutoCarrinhoEvent(
      {super.idUsuario, super.bearer, required this.context, required this.id});
}

final class AtualizarQuantidadeProdutoCarrinhoEvent
    extends IUsuarioCarrinhoEvent {
  final BuildContext context;
  const AtualizarQuantidadeProdutoCarrinhoEvent(
      {super.idUsuario, super.bearer, required this.context});
}
