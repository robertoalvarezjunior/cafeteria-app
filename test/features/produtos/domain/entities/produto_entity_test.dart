import 'package:cafeteria_app/features/produtos/domain/entities/produtos_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('non null', () {
    ProdutosEntity produto = ProdutosEntity(
      idProduto: "idProduto",
      nomeProduto: "nomeProduto",
      precoProduto: 10,
      imagemProduto: "imagemProduto",
      tagProduto: "tagProduto",
    );

    expect(produto.precoProduto, 10);
  });
}
