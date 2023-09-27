import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';

abstract class IUsuarioPedidosRepository {
  List<UsuarioCarrinhoEntity> pedidos = [];
}
