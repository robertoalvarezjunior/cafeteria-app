import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/features/presentation/bloc/produtos/produtos_bloc.dart';
import 'package:cafeteria_app/features/presentation/widgets/produtos/itens_produtos_widget.dart';

class ProdutosPage extends StatelessWidget {
  const ProdutosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProdutosBloc, IProdutosState>(
      listener: (context, state) {
        if (state is ErrorProdutosState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: BlocBuilder<ProdutosBloc, IProdutosState>(
        builder: (context, state) => Scaffold(
          body: switch (state) {
            EmptyProdutosState() => const Center(
                child: Text("Lista de produtos vazia"),
              ),
            InitialProdutosState() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            LoadedProdutosState() => ItensProdutosWidget(state: state),
            ErrorProdutosState() => Center(
                child: Text(state.message),
              ),
          },
        ),
      ),
    );
  }
}
