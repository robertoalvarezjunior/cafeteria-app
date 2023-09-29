part of 'usuario_endereco_bloc.dart';

sealed class IUsuarioEnderecoEvent extends Equatable {
  const IUsuarioEnderecoEvent({this.idUsuario, this.bearer});
  final String? idUsuario;
  final String? bearer;
  @override
  List<Object?> get props => [];
}

final class GetUsuarioEnderecoEvent extends IUsuarioEnderecoEvent {
  const GetUsuarioEnderecoEvent({super.idUsuario, super.bearer});
}

final class AdicionarEnderecoEvent extends IUsuarioEnderecoEvent {
  const AdicionarEnderecoEvent({
    super.idUsuario,
    super.bearer,
    required this.context,
    required this.usuarioEndereco,
  });
  final BuildContext context;
  final UsuarioEnderecoDto usuarioEndereco;
}

final class DeletarEnderecoEvent extends IUsuarioEnderecoEvent {
  const DeletarEnderecoEvent(
      {super.idUsuario, super.bearer, required this.id, required this.context});
  final String id;
  final BuildContext context;
}
