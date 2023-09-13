import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('non null', () {
    ProdutosEntity produto = ProdutosEntity(
      idProduto: "idProduto",
      nomeProduto: "nomeProduto",
      precoProduto: 10,
      imagemProduto: "imagemProduto",
      tagProduto: "tagProduto",
      descricaoProduto: '',
    );

    expect(produto.precoProduto, 10);
  });
}
