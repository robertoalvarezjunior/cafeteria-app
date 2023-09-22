import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cafeteria_app/core/shared_preferences/shared_preferences_core.dart';
import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_dto.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/get_usuario/get_usuario.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/save_usuario/save_usuario.dart';
part 'usuario_event.dart';
part 'usuario_state.dart';

sealed class IUsuarioBloc extends Bloc<IUsuarioEvent, IUsuarioState> {
  late SharedPreferences _prefs;
  IUsuarioBloc(super.initialState) {
    on<LoginUsuarioEvent>(_loginUsuario);
    on<CadastroUsuarioEvent>(_cadastroUsuario);
    on<SalvarInfosUsuarioEvent>(_saveUsuarioInfos);
    on<GetInfosUsuarioEvent>(_startSettings);
  }

  void _loginUsuario(LoginUsuarioEvent event, Emitter<IUsuarioState> emit);

  void _cadastroUsuario(
      CadastroUsuarioEvent event, Emitter<IUsuarioState> emit);

  void _saveUsuarioInfos(
      SalvarInfosUsuarioEvent event, Emitter<IUsuarioState> emit);

  Future<void> _startSettings(
      GetInfosUsuarioEvent event, Emitter<IUsuarioState> emit);
}

final class UsuarioBloc extends IUsuarioBloc {
  UsuarioBloc() : super(InitialUsuarioState());

  @override
  void _cadastroUsuario(
      CadastroUsuarioEvent event, Emitter<IUsuarioState> emit) {
    UsuarioDto usuario = UsuarioDto(
      idUsuario: null,
      email: event.email!,
      senha: event.senha!,
      nome: event.nome!,
      numeroTelefone: event.numeroTelefone!,
    );

    getIt<ISaveUsuario>()
        .saveUsuario(event.context, usuario: usuario)
        .then((value) {
      ScaffoldMessenger.of(event.context).showSnackBar(
        SnackBar(
          content: Text(
            value,
            textAlign: TextAlign.center,
          ),
        ),
      );
    });
  }

  @override
  void _loginUsuario(LoginUsuarioEvent event, Emitter<IUsuarioState> emit) {
    getIt<IGetUsuario>()
        .getUsuario(event.context, email: event.email!, senha: event.senha!)
        .then(
      (value) {
        ScaffoldMessenger.of(event.context).showSnackBar(
          const SnackBar(
            content: Text(
              'Login efetuado com sucesso',
              textAlign: TextAlign.center,
            ),
          ),
        );
        emit(LoginSuccessUsuarioState());
      },
    ).catchError((e) {
      emit(ErrorUsuarioState(e.message));
    });
  }

  @override
  void _saveUsuarioInfos(
      SalvarInfosUsuarioEvent event, Emitter<IUsuarioState> emit) {
    _saveUsuarioInfosLocal({'usuario': event.usuario!, 'token': event.token!});
  }

  @override
  Future<void> _startSettings(
      GetInfosUsuarioEvent event, Emitter<IUsuarioState> emit) async {
    try {
      await _startPreferences();
      emit(LoadingUsuarioState());
      ({Map<String, dynamic> usuario, String? token}) lerInfos =
          await _readUsuarioInfos();

      getIt<ISharedPreferencesCore>().token = lerInfos.token;
      emit(LerInfosUsuarioState(lerInfos.usuario['usuario'], lerInfos.token));
    } catch (e) {
      emit(ErrorUsuarioState(e.toString()));
    }
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

  Future<({Map<String, dynamic> usuario, String? token})>
      _readUsuarioInfos() async {
    final String? tokenShared = _prefs.getString('token');
    final String? usuarioShared = _prefs.getString('usuario');

    return (
      usuario: <String, Map<String, dynamic>?>{
        'usuario': usuarioShared != null ? jsonDecode(usuarioShared) : null,
      },
      token: tokenShared
    );
  }
}
