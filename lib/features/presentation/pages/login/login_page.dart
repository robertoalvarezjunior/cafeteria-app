import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/core/local_storage/usuario_infos_bloc.dart';
import 'package:cafeteria_app/features/presentation/bloc/usuario/usuario_bloc.dart';
import 'package:cafeteria_app/features/presentation/widget/login/login_cadastro_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IUsuarioInfosBloc, IUsuarioInfosState>(
      builder: (context, stateInfo) {
        return BlocBuilder<IUsuarioBloc, IUsuarioState>(
          builder: (context, state) {
            return Scaffold(
              body: switch (stateInfo) {
                LoadingUsuarioInfosState() => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                UsuarioInfosInitialState() => switch (state) {
                    InitialUsuarioState() => LoginCadastroWidget(
                        token: stateInfo.token,
                      ),
                    LoginSuccessUsuarioState() => const Center(
                        child: Text('Logado'),
                      ),
                    ErrorUsuarioState() => Center(
                        child: Text(state.message),
                      ),
                  },
                ErrorUsuarioInfoState() => Center(
                    child: Text(stateInfo.message),
                  ),
              },
            );
          },
        );
      },
    );
  }
}
