import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/config/theme/color_theme.dart';
import 'package:cafeteria_app/features/data/dtos/produtos_dto.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_carrinho_dto.dart';
import 'package:cafeteria_app/features/presentation/bloc/produtos/produtos_bloc.dart';
import 'package:cafeteria_app/features/presentation/bloc/usuario/usuario_bloc.dart';
import 'package:cafeteria_app/features/presentation/bloc/usuario_carrinho/usuario_carrinho_bloc.dart';

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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'R\$ ${e.precoProduto.toStringAsFixed(2).replaceAll('.', ',')}',
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  UsuarioCarrinhoDto usuarioCarrinho =
                                      UsuarioCarrinhoDto(
                                    id: null,
                                    quantidade: 1,
                                    idUsuario: context
                                        .read<IUsuarioBloc>()
                                        .usuarioInfos?['idUsuario'],
                                    produto: ProdutosDto(
                                      id: e.idProduto,
                                      nome:
                                          utf8.decode(e.nomeProduto.codeUnits),
                                      preco: e.precoProduto,
                                      descricao: utf8
                                          .decode(e.descricaoProduto.codeUnits),
                                      imagem: e.imagemProduto,
                                      tag: e.tagProduto,
                                    ),
                                  );

                                  context.read<IUsuarioCarrinhoBloc>().add(
                                        AdicionarProdutoCarrinhoEvent(
                                            context: context,
                                            bearer: context
                                                .read<IUsuarioBloc>()
                                                .tokenInfos,
                                            usuarioCarrinho: usuarioCarrinho),
                                      );
                                },
                                child: Text(
                                  'Adicionar',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: colorTheme(context).primary),
                                ),
                              ),
                            ],
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
