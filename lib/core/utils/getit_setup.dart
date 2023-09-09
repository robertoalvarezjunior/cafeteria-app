import 'package:cafeteria_app/features/produtos/data/data_sources/get_lista_produtos_datasource.dart';
import 'package:cafeteria_app/features/produtos/data/data_sources/remote/get_lista_produtos_remote_datasource_imp.dart';
import 'package:cafeteria_app/features/produtos/data/repositorys/api_repository_imp.dart';
import 'package:cafeteria_app/features/produtos/domain/repositorys/get_lista_produtos_repository.dart';
import 'package:cafeteria_app/features/produtos/domain/usecases/get_lista_produtos/get_lista_produtos.dart';
import 'package:cafeteria_app/features/produtos/domain/usecases/get_lista_produtos/get_lista_produtos_imp.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<IGetListaProdutosDataSource>(
      GetListaProdtutosRemoteDataSourceImp());
  getIt.registerSingleton<IGetListaProdutosRepository>(
      GetListaProdutosRepositoryApiImp());
  getIt.registerSingleton<IGetListaProdutos>(GetListaProdutosImp());
}
