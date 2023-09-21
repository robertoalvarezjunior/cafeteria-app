import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:cafeteria_app/features/presentation/bloc/produtos/produtos_bloc.dart';

class ItensWidget extends StatelessWidget {
  const ItensWidget({
    Key? key,
    required this.state,
    required this.tipo,
  }) : super(key: key);

  final LoadedProdutosState state;
  final String tipo;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...state.produtos
          .where((element) => element.tagProduto == tipo)
          .map(
            (e) => Column(
              children: [
                ListTile(
                  title: Text(
                    utf8.decode(e.nomeProduto.codeUnits),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(utf8.decode(e.descricaoProduto.codeUnits)),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Text(
                            'R\$ ${e.precoProduto.toStringAsFixed(2).replaceAll('.', ',')}',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Image.memory(base64Decode(e.imagemProduto)),
                ),
                const Divider(),
              ],
            ),
          )
          .toList(),
    ]);
  }
}
