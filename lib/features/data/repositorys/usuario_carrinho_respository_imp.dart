import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/data_sources/usuario_carrinho_datasources.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_carrinho_dto.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_carrinho_repository.dart';

final class UsuarioCarrinhoRepositoryImp implements IUsuarioCarrinhoRepository {
  @override
  Future<List<UsuarioCarrinhoEntity>> getUsuarioCarrinho(
      {required String idUsuario, required String bearer}) {
    return getIt<IUsuarioCarrinhoDataSources>()
        .getUsuarioCarrinho(idUsuario: idUsuario, bearer: bearer);
  }

  @override
  Future<String> adicionarItemCarrinho(
      {required UsuarioCarrinhoDto usuarioCarrinho, required String bearer}) {
    return getIt<IUsuarioCarrinhoDataSources>().adicionarItemCarrinho(
        usuarioCarrinho: usuarioCarrinho, bearer: bearer);
  }

  @override
  Future<String> atualizarQuantidadeItemCarrinho(
      {required String id, required int quantidade, required String bearer}) {
    return getIt<IUsuarioCarrinhoDataSources>().atualizarQuantidadeItemCarrinho(
        id: id, quantidade: quantidade, bearer: bearer);
  }

  @override
  Future<String> deleteItemCarrinho(
      {required String id, required String bearer}) {
    return getIt<IUsuarioCarrinhoDataSources>()
        .deleteItemCarrinho(id: id, bearer: bearer);
  }
}
