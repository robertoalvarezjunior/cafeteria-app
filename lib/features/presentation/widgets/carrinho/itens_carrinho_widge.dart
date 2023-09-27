import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/config/theme/color_theme.dart';
import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_pedidos_repository.dart';
import 'package:cafeteria_app/features/presentation/bloc/usuario/usuario_bloc.dart';
import 'package:cafeteria_app/features/presentation/bloc/usuario_carrinho/usuario_carrinho_bloc.dart';

class ItensCarrinhoWidget extends StatelessWidget {
  const ItensCarrinhoWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  final List<UsuarioCarrinhoEntity> state;

  @override
  Widget build(BuildContext context) {
    List<UsuarioCarrinhoEntity> finalizarCarrinho = [];
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              getIt<IUsuarioPedidosRepository>().pedidos = finalizarCarrinho;
            },
            child: const Text('Finalizar'),
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final carrinho = state[index];
            finalizarCarrinho.add(carrinho);
            return ListTile(
              title: Text(
                utf8.decode(carrinho.produtoCarrinho!.nomeProduto.codeUnits),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(utf8.decode(
                      carrinho.produtoCarrinho!.descricaoProduto.codeUnits)),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'R\$ ${carrinho.produtoCarrinho!.precoProduto.toStringAsFixed(2).replaceAll('.', ',')}',
                          style: const TextStyle(fontSize: 15),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => context.read<IUsuarioCarrinhoBloc>().add(
                                DeletarProdutoCarrinhoEvent(
                                  context: context,
                                  id: carrinho.idCarrinho!,
                                  idUsuario: context
                                      .read<IUsuarioBloc>()
                                      .usuarioInfos?['idUsuario'],
                                  bearer:
                                      context.read<IUsuarioBloc>().tokenInfos,
                                ),
                              ),
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
                  ),
                ],
              ),
              trailing: Image.memory(
                base64Decode(carrinho.produtoCarrinho!.imagemProduto),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: state.length),
    );
  }
}
