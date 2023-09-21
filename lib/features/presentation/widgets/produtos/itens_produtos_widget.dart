import 'package:flutter/material.dart';

import 'package:cafeteria_app/features/presentation/bloc/produtos/produtos_bloc.dart';
import 'package:cafeteria_app/features/presentation/widgets/produtos/categorias_widget.dart';
import 'package:cafeteria_app/features/presentation/widgets/produtos/itens_widget.dart';

class ItensProdutosWidget extends StatefulWidget {
  const ItensProdutosWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  final LoadedProdutosState state;

  @override
  State<ItensProdutosWidget> createState() => _ItensProdutosWidgetState();
}

class _ItensProdutosWidgetState extends State<ItensProdutosWidget> {
  final List<GlobalKey> categorias = [GlobalKey(), GlobalKey(), GlobalKey()];
  BuildContext? tabContext;
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_changeTabs);
    super.initState();
  }

  _scrollTo(int index) async {
    scrollController.removeListener(_changeTabs);
    final categoria = categorias[index].currentContext!;

    await Scrollable.ensureVisible(categoria,
        duration: const Duration(milliseconds: 600));
    scrollController.addListener(_changeTabs);
  }

  _changeTabs() {
    late RenderBox box;

    for (var i = 0; i < categorias.length; i++) {
      box = categorias[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);

      if (scrollController.offset >= position.dy) {
        DefaultTabController.of(tabContext!)
            .animateTo(i, duration: const Duration(milliseconds: 100));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(
        builder: (context) {
          tabContext = context;
          return Scaffold(
            appBar: TabBar(
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(child: Text('Café')),
                Tab(child: Text('Chá')),
                Tab(child: Text('Bolo')),
              ],
              onTap: (index) => _scrollTo(index),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    CategoriasWidget(
                        categoriaKey: categorias[0], categoria: 'Café'),
                    ItensWidget(state: widget.state, tipo: 'cafe'),
                    CategoriasWidget(
                        categoriaKey: categorias[1], categoria: 'Chá'),
                    ItensWidget(state: widget.state, tipo: 'cha'),
                    CategoriasWidget(
                        categoriaKey: categorias[2], categoria: 'Bolo'),
                    ItensWidget(state: widget.state, tipo: 'bolo'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
