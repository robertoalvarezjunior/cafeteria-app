import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/data_sources/lista_produtos_datasources.dart';
import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';
import 'package:cafeteria_app/features/domain/repositorys/lista_produtos_repository.dart';

final class ListaProdutosRepositoryApiImp implements IListaProdutosRepository {
  @override
  Future<List<ProdutosEntity>> listaProdutos() {
    return getIt<IListaProdutosDataSource>().listaProdutos();
  }
}
