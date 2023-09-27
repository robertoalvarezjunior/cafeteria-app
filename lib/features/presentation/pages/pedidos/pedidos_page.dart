import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_pedidos_repository.dart';

class PedidosPage extends StatelessWidget {
  const PedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pedidos = getIt<IUsuarioPedidosRepository>().pedidos;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final pedido = pedidos[index];
            return ListTile(
              title: Text(
                  utf8.decode(pedido.produtoCarrinho!.nomeProduto.codeUnits)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(utf8.decode(
                      pedido.produtoCarrinho!.descricaoProduto.codeUnits)),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                        'R\$ ${pedido.produtoCarrinho!.precoProduto.toStringAsFixed(2).replaceAll('.', ',')}'),
                  ),
                ],
              ),
              trailing: Image.memory(
                base64Decode(pedido.produtoCarrinho!.imagemProduto),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: pedidos.length),
    );
  }
}
