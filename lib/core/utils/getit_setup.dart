import 'package:cafeteria_app/features/data/data_sources/get_lista_produtos_datasource.dart';
import 'package:cafeteria_app/features/data/data_sources/get_usuario_datasources.dart';
import 'package:cafeteria_app/features/data/data_sources/get_usuario_enderecos_datasource.dart';
import 'package:cafeteria_app/features/data/data_sources/remote/get_lista_produtos_remote_datasource_imp.dart';
import 'package:cafeteria_app/features/data/data_sources/remote/get_usuario_enderecos_remote_datasources_imp.dart';
import 'package:cafeteria_app/features/data/data_sources/remote/get_usuario_remote_datasources_imp.dart';
import 'package:cafeteria_app/features/data/repositorys/get_lista_produtos_repository_imp.dart';
import 'package:cafeteria_app/features/data/repositorys/get_usuario_enderecos_repository_imp.dart';
import 'package:cafeteria_app/features/data/repositorys/get_usuario_repository_imp.dart';
import 'package:cafeteria_app/features/domain/repositorys/get_lista_produtos_repository.dart';
import 'package:cafeteria_app/features/domain/repositorys/get_usuario_endereco_repository.dart';
import 'package:cafeteria_app/features/domain/repositorys/get_usuario_repository.dart';

import 'package:cafeteria_app/features/domain/usecases/get_lista_produtos/get_lista_produtos.dart';
import 'package:cafeteria_app/features/domain/usecases/get_lista_produtos/get_lista_produtos_imp.dart';
import 'package:cafeteria_app/features/domain/usecases/get_usuario/get_usuario.dart';
import 'package:cafeteria_app/features/domain/usecases/get_usuario/get_usuario_imp.dart';
import 'package:cafeteria_app/features/domain/usecases/get_usuario_endereco/get_usuario_endereco.dart';
import 'package:cafeteria_app/features/domain/usecases/get_usuario_endereco/get_usuario_endereco_imp.dart';

import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<IGetListaProdutos>(GetListaProdutosImp());
  getIt.registerSingleton<IGetListaProdutosRepository>(
      GetListaProdutosRepositoryApiImp());
  getIt.registerSingleton<IGetListaProdutosDataSource>(
      GetListaProdtutosRemoteDataSourceImp());

  getIt.registerSingleton<IGetUsuarioEndereco>(GetUsuarioEnderecoImp());
  getIt.registerSingleton<IGetUsuarioEnderecoRepository>(
      GetUsuarioEnderecoRepositoryImp());
  getIt.registerSingleton<IGetUsuarioEnderecoDataSources>(
      GetUsuarioEnderecosRemoteDataSourcesImp());

  getIt.registerSingleton<IGetUsuario>(GetUsuarioImp());
  getIt.registerSingleton<IGetUsuarioRepository>(GetUsuarioRepositoryImp());
  getIt.registerSingleton<IGetUsuarioDataSources>(GetUsuarioDataSourcesImp());
}
