import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_carrinho_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/delete_item_carrinho/delete_item_carrinho.dart';

final class DeleteItemCarrinhoImp implements IDeleteItemCarrinho {
  @override
  Future<String> deleteItemCarrinho(
      {required String id, required String bearer}) async {
    return await getIt<IUsuarioCarrinhoRepository>()
        .deleteItemCarrinho(id: id, bearer: bearer);
  }
}
