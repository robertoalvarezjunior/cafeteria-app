import 'package:cafeteria_app/core/local_storage/usuario_infos_bloc.dart';
import 'package:cafeteria_app/features/presentation/bloc/produtos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

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
      child: const _ListaProdutosView(),
    );
  }
}

class _ListaProdutosView extends StatelessWidget {
  const _ListaProdutosView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdutosBloc, IProdutosState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context.read<UsuarioInfosBloc>().add(
                    const SalvarUsuarioInfosEvent(
                        usuario: 'teste@teste.com', senha: '1234'));
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: switch (state) {
          InitialProdutosState() => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          EmptyProdutosState() => const Center(
              child: Text("Lista de produtos vazia"),
            ),
          LoadingProdutosState() => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          LoadedProdutosState() => ListView.builder(
              itemCount: state.produtos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.produtos[index].nomeProduto),
                );
              },
            ),
          ErrorProdutosState() => Center(
              child: Text(state.message),
            ),
        },
      ),
    );
  }
}
