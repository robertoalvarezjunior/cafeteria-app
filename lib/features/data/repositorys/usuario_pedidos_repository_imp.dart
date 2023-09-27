import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_pedidos_repository.dart';

final class UsuarioPedidosRepositoryImp implements IUsuarioPedidosRepository {
  @override
  List<UsuarioCarrinhoEntity> pedidos = [];
}
