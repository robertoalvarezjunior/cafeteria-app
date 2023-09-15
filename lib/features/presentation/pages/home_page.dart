import 'package:cafeteria_app/features/presentation/bloc/produtos/produtos_bloc.dart';
import 'package:cafeteria_app/features/presentation/widgets/produtos/itens_produtos_widget.dart';
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
        body: SafeArea(
          child: switch (state) {
            InitialProdutosState() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            EmptyProdutosState() => const Center(
                child: Text("Lista de produtos vazia"),
              ),
            LoadingProdutosState() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            LoadedProdutosState() => ItensProdutosWidget(state: state),
            ErrorProdutosState() => Center(
                child: Text(state.message),
              ),
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_rounded),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
