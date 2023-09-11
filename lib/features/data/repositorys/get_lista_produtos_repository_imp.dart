import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/data_sources/get_lista_produtos_datasource.dart';
import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';
import 'package:cafeteria_app/features/domain/repositorys/get_lista_produtos_repository.dart';

final class GetListaProdutosRepositoryApiImp
    implements IGetListaProdutosRepository {
  @override
  Future<List<ProdutosEntity>> listaProdutos() {
    return getIt<IGetListaProdutosDataSource>().listaProdutos();
  }
}
