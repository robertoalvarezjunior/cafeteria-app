part of 'usuario_bloc.dart';

sealed class IUsuarioEvent extends Equatable {
  final String? usuario;
  final String? senha;
  final String? nome;
  final String? numeroTelefone;
  final BuildContext context;
  const IUsuarioEvent(this.nome, this.numeroTelefone, this.context,
      {required this.usuario, required this.senha});
  @override
  List<Object?> get props => [];
}

final class LoginUsuarioEvent extends IUsuarioEvent {
  const LoginUsuarioEvent(super.nome, super.numeroTelefone, super.context,
      {required super.usuario, required super.senha});
}

final class CadastroUsuarioEvent extends IUsuarioEvent {
  const CadastroUsuarioEvent(super.nome, super.numeroTelefone, super.context,
      {required super.usuario, required super.senha});
}
