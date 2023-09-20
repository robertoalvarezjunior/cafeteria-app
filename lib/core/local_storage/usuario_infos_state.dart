// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'usuario_infos_bloc.dart';

sealed class IUsuarioInfosState extends Equatable {
  const IUsuarioInfosState();
  @override
  List<Object?> get props => [];
}

final class LoadingUsuarioInfosState extends IUsuarioInfosState {}

final class UsuarioInfosInitialState extends IUsuarioInfosState {
  final Map<String, dynamic>? usuario;
  final String? token;

  const UsuarioInfosInitialState({
    this.usuario,
    this.token,
  });
}

final class ErrorUsuarioInfoState extends IUsuarioInfosState {
  final String message;

  const ErrorUsuarioInfoState(this.message);
}
