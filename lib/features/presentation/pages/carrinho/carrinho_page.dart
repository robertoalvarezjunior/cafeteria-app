import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/features/presentation/bloc/usuario/usuario_bloc.dart';
import 'package:cafeteria_app/features/presentation/bloc/usuario_carrinho/usuario_carrinho_bloc.dart';
import 'package:cafeteria_app/features/presentation/widgets/carrinho/itens_carrinho_widge.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  @override
  void initState() {
    var infosUsuario = context.read<IUsuarioBloc>();

    context.read<IUsuarioCarrinhoBloc>().add(GetUsuarioCarrinhoEvent(
        idUsuario: infosUsuario.usuarioInfos!['idUsuario'],
        bearer: infosUsuario.tokenInfos));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IUsuarioCarrinhoBloc, IUsuarioCarrinhoState>(
      builder: (context, state) {
        return Scaffold(
          body: switch (state) {
            InitialUsuarioCarrinhoState() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            EmptyUsuarioCarrinhoState() => const Center(
                child: Text('Carinho vazio'),
              ),
            LoadedUsuarioCarrinhoState() => ItensCarrinhoWidget(state: state),
            ErrorUsuarioCarrinhoState() => Center(
                child: Text(state.message),
              ),
          },
        );
      },
    );
  }
}
