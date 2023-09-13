import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_carrinho_dto.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_carrinho_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/add_item_carrinho/add_item_carrinho.dart';

final class AddItemCarrinhoImp implements IAddItemCarrinho {
  @override
  Future<String> saveUsuarioCarrinho(
      {required UsuarioCarrinhoDto usuarioCarrinho,
      required String bearer}) async {
    return await getIt<IUsuarioCarrinhoRepository>().adicionarItemCarrinho(
        usuarioCarrinho: usuarioCarrinho, bearer: bearer);
  }
}
