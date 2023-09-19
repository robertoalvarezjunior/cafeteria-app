part of 'usuario_infos_bloc.dart';

sealed class IUsuarioInfosEvent extends Equatable {
  const IUsuarioInfosEvent({required this.token, required this.usuario});
  final String? token;
  final String? usuario;
  @override
  List<Object?> get props => [];
}

final class SalvarUsuarioInfosEvent extends IUsuarioInfosEvent {
  const SalvarUsuarioInfosEvent({super.token, super.usuario});
}

final class GetUsuarioInfosEvent extends IUsuarioInfosEvent {
  const GetUsuarioInfosEvent({super.token, super.usuario});
}
