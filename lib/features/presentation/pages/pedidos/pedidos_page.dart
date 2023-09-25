import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafeteria_app/features/presentation/bloc/usuario/usuario_bloc.dart';

class PedidosPage extends StatelessWidget {
  const PedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          onPressed: () => print(context.read<IUsuarioBloc>().usuarioInfos),
          icon: const Icon(Icons.add)),
    );
  }
}
