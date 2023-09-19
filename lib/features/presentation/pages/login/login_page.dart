import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/features/presentation/bloc/usuario/usuario_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController numeroTelefoneController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool cadastro = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Spacer(),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  } else if (!emailController.text.contains('@')) {
                    return 'email inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: senhaController,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              cadastro ? Container() : const SizedBox(height: 15),
              Offstage(
                offstage: cadastro,
                child: TextFormField(
                  controller: nomeController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              cadastro ? Container() : const SizedBox(height: 15),
              Offstage(
                offstage: cadastro,
                child: TextFormField(
                  controller: numeroTelefoneController,
                  decoration:
                      const InputDecoration(labelText: 'Número Celular'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => setState(() {
                      cadastro = !cadastro;
                    }),
                    child: Text(!cadastro ? 'Tenho Conta' : 'Não tenho Conto'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    !cadastro
                        ? context.read<IUsuarioBloc>().add(CadastroUsuarioEvent(
                            nomeController.text,
                            numeroTelefoneController.text,
                            context,
                            usuario: emailController.text,
                            senha: senhaController.text))
                        : context.read<IUsuarioBloc>().add(LoginUsuarioEvent(
                            null, null, context,
                            usuario: emailController.text,
                            senha: senhaController.text));
                  }
                },
                child: Text(!cadastro ? 'Cadastrar' : 'Logar'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
