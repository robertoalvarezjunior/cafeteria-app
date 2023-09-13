import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/atualizar_quantidade_item_carrinho/atualizar_quantidade_item_carrinho.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  getItSetup();
  test('atualizarQuantidadeItemCarrinho', () async {
    var result = await getIt<IAtualizarQuantidadeItemCarrinho>()
        .atualizarQuantidadeItemCarrinho(
            id: 'f1b4b4ac-7952-4d65-99ec-0b223d6d50ba',
            quantidade: -1,
            bearer:
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhY2Nlc3NUb2tlbiIsImlzcyI6Imlzc3VlciIsImV4cCI6MTY5NDY5MDkxNCwiZW1haWwiOiJ0ZXN0ZUB0ZXN0ZS5jb20ifQ.ZjxB23lKZAOHlrSIPvR_n3CmiTIV03MdNYxZvelZ4-4');

    expect(result, 'Quantidade atualizada');
  });
}
