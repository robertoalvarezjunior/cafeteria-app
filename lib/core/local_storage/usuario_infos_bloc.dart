import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'usuario_infos_event.dart';
part 'usuario_infos_state.dart';

sealed class IUsuarioInfosBloc
    extends Bloc<IUsuarioInfosEvent, IUsuarioInfosState> {
  late SharedPreferences _prefs;
  IUsuarioInfosBloc(super.initialState) {
    on<SalvarUsuarioInfosEvent>(_saveUsuarioInfos);
    on<GetUsuarioInfosEvent>(_startSettings);
  }

  void _saveUsuarioInfos(
      IUsuarioInfosEvent event, Emitter<IUsuarioInfosState> emit);

  Future<void> _startSettings(
      IUsuarioInfosEvent event, Emitter<IUsuarioInfosState> emit);
}

final class UsuarioInfosBloc extends IUsuarioInfosBloc {
  UsuarioInfosBloc() : super(LoadingUsuarioInfosState());

  @override
  void _saveUsuarioInfos(
      IUsuarioInfosEvent event, Emitter<IUsuarioInfosState> emit) {
    _saveUsuarioInfosLocal({'usuario': event.usuario!, 'token': event.token!});
  }

  @override
  Future<void> _startSettings(
      IUsuarioInfosEvent event, Emitter<IUsuarioInfosState> emit) async {
    try {
      await _startPreferences();
      emit(LoadingUsuarioInfosState());
      ({Map<String, dynamic> usuario, String? token}) lerInfos =
          await _readUsuarioInfos();
      //copiar o emptyProdutos

      emit(UsuarioInfosInitialState(
          usuario: lerInfos.usuario['usuario'], token: lerInfos.token));
    } catch (e) {
      emit(ErrorUsuarioInfoState(e.toString()));
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
