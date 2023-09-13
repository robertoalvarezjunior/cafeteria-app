import 'package:cafeteria_app/features/data/dtos/usuario_carrinho_dto.dart';

abstract class IAddItemCarrinho {
  Future<String> saveUsuarioCarrinho(
      {required UsuarioCarrinhoDto usuarioCarrinho, required String bearer});
}
