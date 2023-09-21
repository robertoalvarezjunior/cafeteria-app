import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/features/presentation/bloc/usuario/usuario_bloc.dart';
import 'package:cafeteria_app/features/presentation/widgets/login/login_cadastro_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<IUsuarioBloc, IUsuarioState>(
      listener: (context, state) {
        if (state is ErrorUsuarioState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: BlocBuilder<IUsuarioBloc, IUsuarioState>(
        builder: (context, state) => Scaffold(
          body: switch (state) {
            InitialUsuarioState() => const LoginCadastroWidget(),
            LoginSuccessUsuarioState() => const Center(
                child: Text('Logado'),
              ),
            LoadingUsuarioState() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            LerInfosUsuarioState() => state.token == null
                ? const LoginCadastroWidget()
                : const Center(
                    child: Text('Logado'),
                  ),
            ErrorUsuarioState() => Center(
                child: Text(state.message),
              ),
          },
        ),
      ),
    );
  }
}
