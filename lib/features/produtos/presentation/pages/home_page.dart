import 'package:cafeteria_app/features/produtos/presentation/bloc/produtos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final ProdutosBloc _produtosBloc = ProdutosBloc();

  @override
  void initState() {
    _produtosBloc.add(GetProdutosEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _produtosBloc,
      child: BlocListener<ProdutosBloc, ProdutosState>(
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
      ),
    );
  }
}

class _ListaProdutosView extends StatelessWidget {
  const _ListaProdutosView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdutosBloc, ProdutosState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(),
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
          ErrorProdutosState() => const Center(
              child: Text("Erro"),
            ),
        },
      ),
    );
  }
}
