import 'package:flutter_test/flutter_test.dart';

import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/get_usuario_carrinho/get_usuario_carrinho.dart';

void main() {
  getItSetup();
  test('lista de produtos no carrinho', () async {
    var result = await getIt<IGetUsuarioCarrinho>().getUsuarioCarrinho(
        idUsuario: 'c5adf1ba-aee7-4e3d-95e3-f43d4140a679',
        bearer:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhY2Nlc3NUb2tlbiIsImlzcyI6Imlzc3VlciIsImV4cCI6MTY5NTcxNjk4OCwiZW1haWwiOiJ0ZXN0ZUB0ZXN0ZS5jb20ifQ.Q-1-NkM9UF89DKyC2J7ns_8Lz5xQkS4_IozKUQsY3YU');

    expect(result, isInstanceOf<List<UsuarioCarrinhoEntity>>());
  });
}
