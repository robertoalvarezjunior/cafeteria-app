import 'package:cafeteria_app/config/theme/color_theme.dart';
import 'package:cafeteria_app/features/presentation/bloc/produtos/produtos_bloc.dart';
import 'package:cafeteria_app/features/presentation/widgets/produtos/bolo_widget.dart';
import 'package:cafeteria_app/features/presentation/widgets/produtos/cafe_widget.dart';
import 'package:cafeteria_app/features/presentation/widgets/produtos/cha_widget.dart';
import 'package:flutter/material.dart';

class ItensProdutosWidget extends StatelessWidget {
  const ItensProdutosWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  final LoadedProdutosState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colorTheme(context).surfaceVariant,
              ),
              width: MediaQuery.of(context).size.width * .2,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Chá',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colorTheme(context).surfaceVariant,
              ),
              width: MediaQuery.of(context).size.width * .2,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Bolo',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colorTheme(context).surfaceVariant,
              ),
              width: MediaQuery.of(context).size.width * .2,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Café',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Café',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  CafeWidget(state: state),
                  const Text(
                    'Chá',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ChaWidget(state: state),
                  const Text(
                    'Bolo',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  BoloWidget(state: state),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
