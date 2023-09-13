import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/get_usuario_carrinho/get_usuario_carrinho.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  getItSetup();
  test('lista de produtos no carrinho', () async {
    var result = await getIt<IGetUsuarioCarrinho>().getUsuarioCarrinho(
        idUsuario: 'c5adf1ba-aee7-4e3d-95e3-f43d4140a679',
        bearer:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhY2Nlc3NUb2tlbiIsImlzcyI6Imlzc3VlciIsImV4cCI6MTY5NDY4ODY5NSwiZW1haWwiOiJ0ZXN0ZUB0ZXN0ZS5jb20ifQ.9_GNuniqs8BEgS4C0G7JDEBEd5Ulok2mdvwTBBlAhqA');

    expect(result, isInstanceOf<List<UsuarioCarrinhoEntity>>());
  });
}
