import 'package:flutter/material.dart';

import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_pedidos_repository.dart';
import 'package:cafeteria_app/features/presentation/widgets/endereco/cadastrar_endereco_widget.dart';
import 'package:cafeteria_app/features/presentation/widgets/endereco/endereco_widget.dart';

class EnderecosPage extends StatelessWidget {
  const EnderecosPage({super.key, required this.finalizarCarrinho});
  final List<UsuarioCarrinhoEntity> finalizarCarrinho;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              getIt<IUsuarioPedidosRepository>().pedidos = finalizarCarrinho;
            },
            child: const Text('Finalizar Pedido'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: EnderecoWidget(),
          ),
          Center(
            child: FilledButton(
              onPressed: () {
                showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  isScrollControlled: true,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 1),
                  builder: (context) => const CadastrarEnderecoWidget(),
                );
              },
              child: const Text('Cadastrar Endereço'),
            ),
          ),
        ],
      ),
    );
  }
}
