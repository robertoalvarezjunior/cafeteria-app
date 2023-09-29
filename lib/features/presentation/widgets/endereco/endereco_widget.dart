import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/config/theme/color_theme.dart';
import 'package:cafeteria_app/features/presentation/bloc/usuario/usuario_bloc.dart';
import 'package:cafeteria_app/features/presentation/bloc/usuario_endereco/usuario_endereco_bloc.dart';

class EnderecoWidget extends StatefulWidget {
  const EnderecoWidget({super.key});

  @override
  State<EnderecoWidget> createState() => _EnderecoWidgetState();
}

class _EnderecoWidgetState extends State<EnderecoWidget> {
  int enderecoSelecionado = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IUsuarioEnderecoBloc, IUsuarioEnderecoState>(
      builder: (context, state) => switch (state) {
        InitialUsuarioEnderecoState() => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        EmptyUsuarioEnderecoState() => const Center(
            child: Text('Endereço vazio'),
          ),
        LoadedUsuarioEnderecoState() => ListView.separated(
            itemBuilder: (context, index) {
              final enderecos = state.endereco[index];
              return RadioListTile.adaptive(
                value: index,
                groupValue: enderecoSelecionado,
                onChanged: (int? value) {
                  setState(() {
                    enderecoSelecionado = value!;
                  });
                },
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Cidade: ${utf8.decode(enderecos.cidadeUsuarioEndereco!.codeUnits)}'),
                        Text(
                            'Estado: ${utf8.decode(enderecos.estadoUsuarioEnderecUsuaro!.codeUnits)}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Rua: ${utf8.decode(enderecos.ruaUsuarioEndereco!.codeUnits)}'),
                        const SizedBox(width: 10),
                        Text(
                            'Número: ${utf8.decode(enderecos.numeroUsuarioEndereco!.codeUnits)}'),
                      ],
                    ),
                    enderecos.complementoUsuarioEndereco != null
                        ? Text(
                            'Complemento: ${utf8.decode(enderecos.complementoUsuarioEndereco!.codeUnits)}')
                        : Container(),
                    Text(
                        'CEP: ${utf8.decode(enderecos.cepUsuarioEndereco!.codeUnits)}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            context.read<IUsuarioEnderecoBloc>().add(
                                  DeletarEnderecoEvent(
                                    context: context,
                                    id: enderecos.idEndereco!,
                                    idUsuario: context
                                        .read<IUsuarioBloc>()
                                        .usuarioInfos?['idUsuario'],
                                    bearer:
                                        context.read<IUsuarioBloc>().tokenInfos,
                                  ),
                                );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Remover',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorTheme(context).primary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.endereco.length),
        ErrorUsuarioEnderecoState() => Center(
            child: Text(state.message),
          ),
      },
    );
  }
}
