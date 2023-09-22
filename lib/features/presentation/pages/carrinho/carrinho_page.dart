import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/features/presentation/bloc/usuario_carrinho/usuario_carrinho_bloc.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IUsuarioCarrinhoBloc, IUsuarioCarrinhoState>(
      builder: (context, state) {
        return switch (state) {
          InitialUsuarioCarrinhoState() => Center(
              child: TextButton(
                  onPressed: () => context
                      .read<IUsuarioCarrinhoBloc>()
                      .add(AdicionarProdutoCarrinhoEvent()),
                  child: const Text('carrinho')),
            ),
          EmptyUsuarioCarrinhoState() => const Center(
              child: Text('vazio'),
            ),
          LoadedUsuarioCarrinhoState() => const Center(
              child: CircularProgressIndicator(),
            ),
          ErrorUsuarioCarrinhoState() => Center(
              child: Text(state.message),
            ),
        };
      },
    );
  }
}
