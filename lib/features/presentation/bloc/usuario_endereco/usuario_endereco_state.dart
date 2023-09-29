part of 'usuario_endereco_bloc.dart';

sealed class IUsuarioEnderecoState extends Equatable {
  const IUsuarioEnderecoState();
  @override
  List<Object?> get props => [];
}

final class InitialUsuarioEnderecoState extends IUsuarioEnderecoState {}

final class EmptyUsuarioEnderecoState extends IUsuarioEnderecoState {}

final class ErrorUsuarioEnderecoState extends IUsuarioEnderecoState {
  final String message;

  const ErrorUsuarioEnderecoState(this.message);
}

final class LoadedUsuarioEnderecoState extends IUsuarioEnderecoState {
  final List<UsuarioEnderecoEntity> endereco;
  const LoadedUsuarioEnderecoState(this.endereco);
}
