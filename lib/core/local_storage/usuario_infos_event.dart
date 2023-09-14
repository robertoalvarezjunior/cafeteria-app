part of 'usuario_infos_bloc.dart';

sealed class UsuarioInfosEvent extends Equatable {
  const UsuarioInfosEvent({required this.senha, required this.usuario});
  final String? senha;
  final String? usuario;
  @override
  List<Object?> get props => [];
}

final class SalvarUsuarioInfosEvent extends UsuarioInfosEvent {
  const SalvarUsuarioInfosEvent({required super.senha, required super.usuario});
}

final class GetUsuarioInfosEvent extends UsuarioInfosEvent {
  const GetUsuarioInfosEvent({super.senha, super.usuario});
}
