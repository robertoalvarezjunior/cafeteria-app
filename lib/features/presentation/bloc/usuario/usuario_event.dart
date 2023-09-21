part of 'usuario_bloc.dart';

sealed class IUsuarioEvent extends Equatable {
  final String? token;
  final String? usuario;
  const IUsuarioEvent({this.token, this.usuario});
  @override
  List<Object?> get props => [];
}

final class LoginUsuarioEvent extends IUsuarioEvent {
  final String? email;
  final String? senha;
  final BuildContext context;

  const LoginUsuarioEvent(this.context,
      {required this.email, required this.senha})
      : super(token: null, usuario: null);
}

final class CadastroUsuarioEvent extends IUsuarioEvent {
  final String? email;
  final String? senha;
  final String? nome;
  final String? numeroTelefone;
  final BuildContext context;

  const CadastroUsuarioEvent(this.context,
      {this.email, this.senha, this.nome, this.numeroTelefone})
      : super(token: null, usuario: null);
}

final class SalvarInfosUsuarioEvent extends IUsuarioEvent {
  const SalvarInfosUsuarioEvent({super.token, super.usuario});
}

final class GetInfosUsuarioEvent extends IUsuarioEvent {
  const GetInfosUsuarioEvent({super.token, super.usuario});
}
