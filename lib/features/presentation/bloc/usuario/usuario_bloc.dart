import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_dto.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/get_usuario/get_usuario.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/save_usuario/save_usuario.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

sealed class IUsuarioBloc extends Bloc<IUsuarioEvent, IUsuarioState> {
  IUsuarioBloc(super.initialState) {
    on<LoginUsuarioEvent>(_loginUsuario);
    on<CadastroUsuarioEvent>(_cadastroUsuario);
  }

  void _loginUsuario(IUsuarioEvent event, Emitter<IUsuarioState> emit);

  void _cadastroUsuario(IUsuarioEvent event, Emitter<IUsuarioState> emit);
}

final class UsuarioBloc extends IUsuarioBloc {
  UsuarioBloc() : super(InitialUsuarioState());

  @override
  void _cadastroUsuario(IUsuarioEvent event, Emitter<IUsuarioState> emit) {
    UsuarioDto usuario = UsuarioDto(
      idUsuario: null,
      email: event.usuario!,
      senha: event.senha!,
      nome: event.nome!,
      numeroTelefone: event.numeroTelefone!,
    );

    getIt<ISaveUsuario>()
        .saveUsuario(event.context, usuario: usuario)
        .then((value) => ScaffoldMessenger.of(event.context).showSnackBar(
              SnackBar(
                content: Text(
                  value,
                  textAlign: TextAlign.center,
                ),
              ),
            ));
  }

  @override
  void _loginUsuario(IUsuarioEvent event, Emitter<IUsuarioState> emit) {
    try {
      getIt<IGetUsuario>()
          .getUsuario(event.context, email: event.usuario!, senha: event.senha!)
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
      );
    } on CatchError catch (e) {
      emit(ErrorUsuarioState(e.message));
    }
  }
}
