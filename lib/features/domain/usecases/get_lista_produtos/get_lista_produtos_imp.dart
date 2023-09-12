import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';
import 'package:cafeteria_app/features/domain/repositorys/lista_produtos_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/get_lista_produtos/get_lista_produtos.dart';

final class GetListaProdutosImp implements IGetListaProdutos {
  @override
  Future<List<ProdutosEntity>> listaProdutos() async {
    return await getIt<IListaProdutosRepository>().listaProdutos();
  }
}
