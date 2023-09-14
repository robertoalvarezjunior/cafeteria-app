import 'dart:convert';

import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/get_usuario/get_usuario.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'usuario_infos_event.dart';
part 'usuario_infos_state.dart';

sealed class IUsuarioInfosBloc
    extends Bloc<UsuarioInfosEvent, UsuarioInfosState> {
  Map<String, Map<String, dynamic>?> usuario = {
    'usuario': null,
  };
  late SharedPreferences _prefs;
  String? token;
  IUsuarioInfosBloc(super.initialState) {
    on<SalvarUsuarioInfosEvent>(_saveUsuarioInfos);
    on<GetUsuarioInfosEvent>(_startSettings);
  }

  void _saveUsuarioInfos(
      UsuarioInfosEvent event, Emitter<UsuarioInfosState> emit);

  Future<void> _startSettings(
      UsuarioInfosEvent event, Emitter<UsuarioInfosState> emit);
}

final class UsuarioInfosBloc extends IUsuarioInfosBloc {
  UsuarioInfosBloc() : super(UsuarioInfosInitialState());

  @override
  void _saveUsuarioInfos(
      UsuarioInfosEvent event, Emitter<UsuarioInfosState> emit) {
    getIt<IGetUsuario>()
        .getUsuario(email: event.usuario!, senha: event.senha!)
        .then((value) => _saveUsuarioInfosLocal(value));
  }

  @override
  Future<void> _startSettings(
      UsuarioInfosEvent event, Emitter<UsuarioInfosState> emit) async {
    await _startPreferences();
    await _readUsuarioInfos();
  }

  Future<void> _startPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _saveUsuarioInfosLocal(Map<String, String> json) async {
    _prefs = await SharedPreferences.getInstance();

    await _prefs.setString('usuario', json['usuario'] ?? '');
    await _prefs.setString('token', json['token'] ?? '');

    await _readUsuarioInfos();
  }

  Future<void> _readUsuarioInfos() async {
    final String? tokenShared = _prefs.getString('token');
    final String? usuarioShared = _prefs.getString('usuario');

    usuario = {
      'usuario': usuarioShared != null ? jsonDecode(usuarioShared) : null
    };
    token = tokenShared;
  }
}
