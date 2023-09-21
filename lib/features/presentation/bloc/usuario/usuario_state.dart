part of 'usuario_bloc.dart';

sealed class IUsuarioState extends Equatable {
  const IUsuarioState();
  @override
  List<Object?> get props => [];
}

final class InitialUsuarioState extends IUsuarioState {}

final class LoginSuccessUsuarioState extends IUsuarioState {}

final class LoadingUsuarioState extends IUsuarioState {}

final class LerInfosUsuarioState extends IUsuarioState {
  final Map<String, dynamic>? usuario;
  final String? token;

  const LerInfosUsuarioState(this.usuario, this.token);
}

final class ErrorUsuarioState extends IUsuarioState {
  final String message;

  const ErrorUsuarioState(this.message);
}
