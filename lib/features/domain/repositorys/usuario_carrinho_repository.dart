import 'package:cafeteria_app/features/data/dtos/usuario_carrinho_dto.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';

abstract class IUsuarioCarrinhoRepository {
  Future<List<UsuarioCarrinhoEntity>> getUsuarioCarrinho(
      {required String idUsuario, required String bearer});

  Future<String> adicionarItemCarrinho(
      {required UsuarioCarrinhoDto usuarioCarrinho, required String bearer});

  Future<String> atualizarQuantidadeItemCarrinho(
      {required String id, required int quantidade, required String bearer});

  Future<String> deleteItemCarrinho(
      {required String id, required String bearer});
}
