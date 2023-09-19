part of 'usuario_bloc.dart';

sealed class IUsuarioState extends Equatable {
  const IUsuarioState();
  @override
  List<Object?> get props => [];
}

final class InitialUsuarioState extends IUsuarioState {}

final class ErrorUsuarioState extends IUsuarioState {
  final String message;

  const ErrorUsuarioState(this.message);
}

final class LoginUsuarioState extends IUsuarioState {}

final class CadastroUsuarioState extends IUsuarioState {}

final class ErrorCadastroUsuarioState extends IUsuarioState {
  final String message;

  const ErrorCadastroUsuarioState(this.message);
}