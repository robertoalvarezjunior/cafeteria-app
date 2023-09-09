import 'package:cafeteria_app/features/produtos/domain/entities/usuario_carrinho_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('usuarioCarrinho entity', () {
    UsuarioCarrinhoEntity usuarioCarrinho = UsuarioCarrinhoEntity(
      idUsuarioCarrinho: 'idUsuarioCarrinho',
      quantidadeCarrinho: 1,
      produtoCarrinho: null,
    );

    expect(usuarioCarrinho, isNotNull);
  });
}
