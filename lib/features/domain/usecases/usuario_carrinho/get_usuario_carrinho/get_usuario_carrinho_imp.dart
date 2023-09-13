import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_carrinho_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/get_usuario_carrinho/get_usuario_carrinho.dart';

final class GetUsuarioCarrinhoImp implements IGetUsuarioCarrinho {
  @override
  Future<List<UsuarioCarrinhoEntity>> getUsuarioCarrinho(
      {required String idUsuario, required String bearer}) async {
    return await getIt<IUsuarioCarrinhoRepository>()
        .getUsuarioCarrinho(idUsuario: idUsuario, bearer: bearer);
  }
}
