// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cafeteria_app/config/theme/color_theme.dart';
import 'package:flutter/material.dart';

import 'package:cafeteria_app/features/presentation/bloc/produtos/produtos_bloc.dart';

class CafeWidget extends StatelessWidget {
  const CafeWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  final LoadedProdutosState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: state.produtos
          .where((element) => element.tagProduto == 'cafe')
          .map(
            (e) => Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorTheme(context).inversePrimary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                          child: Image.memory(base64Decode(e.imagemProduto)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          utf8.decode(e.nomeProduto.codeUnits),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          utf8.decode(e.descricaoProduto.codeUnits),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart_rounded,
                            color: colorTheme(context).primary,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            'R\$ ${e.precoProduto.toStringAsFixed(2).replaceAll('.', ',')}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
          .toList(),
    );
  }
}
