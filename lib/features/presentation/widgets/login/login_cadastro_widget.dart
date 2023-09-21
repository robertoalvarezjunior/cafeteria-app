import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:cafeteria_app/features/presentation/bloc/usuario/usuario_bloc.dart';

class LoginCadastroWidget extends StatefulWidget {
  const LoginCadastroWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginCadastroWidget> createState() => _LoginCadastroWidgetState();
}

class _LoginCadastroWidgetState extends State<LoginCadastroWidget> {
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController senhaLoginController = TextEditingController();
  final TextEditingController emailCadastroController = TextEditingController();
  final TextEditingController senhaCadastroController = TextEditingController();
  final TextEditingController nomeCadastroController = TextEditingController();
  final TextEditingController numeroTelefoneCadastroController =
      TextEditingController();

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyCadastro = GlobalKey<FormState>();

  bool verSenhaLogin = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeyLogin,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Spacer(),
            TextFormField(
              controller: emailLoginController,
              decoration: const InputDecoration(labelText: 'E-mail'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                } else if (!emailLoginController.text.contains('@')) {
                  return 'email inválido';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: senhaLoginController,
              decoration: InputDecoration(
                labelText: 'Senha',
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    verSenhaLogin = !verSenhaLogin;
                  }),
                  icon: !verSenhaLogin
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
              obscureText: !verSenhaLogin,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Recuperar Senha'),
                ),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 1),
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Form(
                                key: _formKeyCadastro,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: nomeCadastroController,
                                      decoration: const InputDecoration(
                                          labelText: 'Nome'),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Campo obrigatório';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller:
                                          numeroTelefoneCadastroController,
                                      decoration: const InputDecoration(
                                          labelText: 'Número Celular'),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Campo obrigatório';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: emailCadastroController,
                                      decoration: const InputDecoration(
                                          labelText: 'Email'),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Campo obrigatório';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: senhaCadastroController,
                                      decoration: const InputDecoration(
                                        labelText: 'Senha',
                                      ),
                                      obscureText: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Campo obrigatório';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_formKeyCadastro.currentState!
                                            .validate()) {
                                          context.read<IUsuarioBloc>().add(
                                              CadastroUsuarioEvent(
                                                  nome: nomeCadastroController
                                                      .text,
                                                  numeroTelefone:
                                                      numeroTelefoneCadastroController
                                                          .text,
                                                  context,
                                                  email: emailCadastroController
                                                      .text,
                                                  senha: senhaCadastroController
                                                      .text));
                                          context.pop();
                                        }
                                      },
                                      child: const Text('Cadastrar'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text('Fazer Cadastro'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKeyLogin.currentState!.validate()) {
                  context.read<IUsuarioBloc>().add(
                        LoginUsuarioEvent(context,
                            email: emailLoginController.text,
                            senha: senhaLoginController.text),
                      );
                }
              },
              child: const Text('Logar'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
