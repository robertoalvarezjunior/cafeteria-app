import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:cafeteria_app/features/data/dtos/usuario_endereco_dto.dart';
import 'package:cafeteria_app/features/presentation/bloc/usuario/usuario_bloc.dart';
import 'package:cafeteria_app/features/presentation/bloc/usuario_endereco/usuario_endereco_bloc.dart';

class CadastrarEnderecoWidget extends StatelessWidget {
  const CadastrarEnderecoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKeyEndereco = GlobalKey<FormState>();
    final TextEditingController ruaController = TextEditingController();
    final TextEditingController cidadeController = TextEditingController();
    final TextEditingController estadoController = TextEditingController();
    final TextEditingController cepController = TextEditingController();
    final TextEditingController numeroController = TextEditingController();
    final TextEditingController complementoController = TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKeyEndereco,
          child: Column(
            children: [
              TextFormField(
                controller: ruaController,
                decoration: const InputDecoration(labelText: 'Rua'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: cidadeController,
                decoration: const InputDecoration(labelText: 'Cidade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: estadoController,
                decoration: const InputDecoration(labelText: 'Estado'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: cepController,
                decoration: const InputDecoration(labelText: 'CEP'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: numeroController,
                decoration: const InputDecoration(labelText: 'Número'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: complementoController,
                decoration: const InputDecoration(labelText: 'Complemento'),
              ),
              FilledButton(
                onPressed: () {
                  if (formKeyEndereco.currentState!.validate()) {
                    var complemento = complementoController.text == ''
                        ? null
                        : complementoController.text;
                    UsuarioEnderecoDto endereco = UsuarioEnderecoDto(
                      id: null,
                      idUsuario: context
                          .read<IUsuarioBloc>()
                          .usuarioInfos?['idUsuario'],
                      complemento: complemento,
                      rua: ruaController.text,
                      cidade: cidadeController.text,
                      estado: estadoController.text,
                      cep: cepController.text,
                      numero: numeroController.text,
                    );

                    context.read<IUsuarioEnderecoBloc>().add(
                          AdicionarEnderecoEvent(
                              idUsuario: context
                                  .read<IUsuarioBloc>()
                                  .usuarioInfos?['idUsuario'],
                              bearer: context.read<IUsuarioBloc>().tokenInfos,
                              context: context,
                              usuarioEndereco: endereco),
                        );

                    context.pop();
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Cadastrar'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
