import 'package:cafeteria_app/core/utils/getit_setup.dart';

import 'package:cafeteria_app/features/produtos/domain/entities/produtos_entity.dart';
import 'package:cafeteria_app/features/produtos/domain/usecases/get_lista_produtos/get_lista_produtos.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  getItSetup();
  test('retornar lista de produtos', () async {
    var result = await getIt<IGetListaProdutos>().listaProdutos();

    expect(result, isInstanceOf<List<ProdutosEntity>>());
  });
}
