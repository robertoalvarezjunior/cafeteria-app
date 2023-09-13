import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/dtos/produtos_dto.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_carrinho_dto.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/add_item_carrinho/add_item_carrinho.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  getItSetup();
  test('item adicionado no carrinho', () async {
    var produto = ProdutosDto(
        id: 'produto teste',
        nome: 'nome',
        preco: 2.5,
        imagem: 'imagem',
        descricao: 'descricao teste',
        tag: 'tag');
    var usuariocarrinho = UsuarioCarrinhoDto(
        idUsuario: 'c5adf1ba-aee7-4e3d-95e3-f43d4140a679',
        quantidade: 1,
        produto: produto);
    var result = await getIt<IAddItemCarrinho>().saveUsuarioCarrinho(
        usuarioCarrinho: usuariocarrinho,
        bearer:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhY2Nlc3NUb2tlbiIsImlzcyI6Imlzc3VlciIsImV4cCI6MTY5NDY5MDkxNCwiZW1haWwiOiJ0ZXN0ZUB0ZXN0ZS5jb20ifQ.ZjxB23lKZAOHlrSIPvR_n3CmiTIV03MdNYxZvelZ4-4');

    expect(result, 'Produto adicionado ao carrinho');
  });
}
