import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_carrinho_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/atualizar_quantidade_item_carrinho/atualizar_quantidade_item_carrinho.dart';

final class AtualizarQuantidadeItemCarrinhoImp
    implements IAtualizarQuantidadeItemCarrinho {
  @override
  Future<String> atualizarQuantidadeItemCarrinho(
      {required String id,
      required int quantidade,
      required String bearer}) async {
    return await getIt<IUsuarioCarrinhoRepository>()
        .atualizarQuantidadeItemCarrinho(
            id: id, quantidade: quantidade, bearer: bearer);
  }
}
