// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CategoriasWidget extends StatelessWidget {
  const CategoriasWidget({
    Key? key,
    required this.categoriaKey,
    required this.categoria,
  }) : super(key: key);

  final Key categoriaKey;
  final String categoria;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          key: categoriaKey,
          title: Text(
            categoria,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
