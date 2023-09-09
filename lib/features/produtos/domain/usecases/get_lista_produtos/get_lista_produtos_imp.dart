import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/produtos/domain/entities/produtos_entity.dart';
import 'package:cafeteria_app/features/produtos/domain/repositorys/get_lista_produtos_repository.dart';
import 'package:cafeteria_app/features/produtos/domain/usecases/get_lista_produtos/get_lista_produtos.dart';

final class GetListaProdutosImp implements IGetListaProdutos {
  @override
  Future<List<ProdutosEntity>> listaProdutos() async {
    return await getIt<IGetListaProdutosRepository>()
        .listaProdutos()
        .then((value) => value);
  }
}
