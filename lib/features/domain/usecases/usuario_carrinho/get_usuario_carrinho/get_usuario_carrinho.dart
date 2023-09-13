import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';

abstract class IGetUsuarioCarrinho {
  Future<List<UsuarioCarrinhoEntity>> getUsuarioCarrinho(
      {required String idUsuario, required String bearer});
}
