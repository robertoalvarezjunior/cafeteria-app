import 'package:get_it/get_it.dart';

import 'package:cafeteria_app/features/data/data_sources/lista_produtos_datasources.dart';
import 'package:cafeteria_app/features/data/data_sources/remote/lista_produtos_remote_datasource_imp.dart';
import 'package:cafeteria_app/features/data/data_sources/remote/usuario_carrinho_remote_datasources_imp.dart';
import 'package:cafeteria_app/features/data/data_sources/remote/usuario_endereco_remote_datasources_imp.dart';
import 'package:cafeteria_app/features/data/data_sources/remote/usuario_remote_datasources_imp.dart';
import 'package:cafeteria_app/features/data/data_sources/usuario_carrinho_datasources.dart';
import 'package:cafeteria_app/features/data/data_sources/usuario_datasources.dart';
import 'package:cafeteria_app/features/data/data_sources/usuario_endereco_datasources.dart';
import 'package:cafeteria_app/features/data/repositorys/lista_produtos_repository_imp.dart';
import 'package:cafeteria_app/features/data/repositorys/usuario_carrinho_respository_imp.dart';
import 'package:cafeteria_app/features/data/repositorys/usuario_endereco_repository_imp.dart';
import 'package:cafeteria_app/features/data/repositorys/usuario_repository_imp.dart';
import 'package:cafeteria_app/features/domain/repositorys/lista_produtos_repository.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_carrinho_repository.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_endereco_repository.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/lista_produtos/get_lista_produtos.dart';
import 'package:cafeteria_app/features/domain/usecases/lista_produtos/get_lista_produtos_imp.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/get_usuario/get_usuario.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/get_usuario/get_usuario_imp.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/save_usuario/save_usuario.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/save_usuario/save_usuario_imp.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/add_item_carrinho/add_item_carrinho.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/add_item_carrinho/add_item_carrinho_imp.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/atualizar_quantidade_item_carrinho/atualizar_quantidade_item_carrinho.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/atualizar_quantidade_item_carrinho/atualizar_quantidade_item_carrinho_imp.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/delete_item_carrinho/delete_item_carrinho.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/delete_item_carrinho/delete_item_carrinho_imp.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/get_usuario_carrinho/get_usuario_carrinho.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_carrinho/get_usuario_carrinho/get_usuario_carrinho_imp.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/delete_usuario_endereco/delete_usuario_endereco.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/delete_usuario_endereco/delete_usuario_endereco_imp.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/get_usuario_endereco/get_usuario_endereco.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/get_usuario_endereco/get_usuario_endereco_imp.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/save_usuario_endereco/save_usuario_endereco.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/save_usuario_endereco/save_usuario_endereco_imp.dart';
import 'package:cafeteria_app/features/presentation/bloc/usuario/usuario_bloc.dart';

final GetIt getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<IGetUsuario>(GetUsuarioImp());
  getIt.registerSingleton<ISaveUsuario>(SaveUsuarioImp());
  getIt.registerSingleton<IUsuarioRepository>(UsuarioRepositoryImp());
  getIt.registerSingleton<IUsuarioDataSources>(UsuarioDataSourcesImp());

  getIt.registerSingleton<IGetUsuarioEndereco>(GetUsuarioEnderecoImp());
  getIt.registerSingleton<ISaveUsuarioEndereco>(SaveUsuarioEnderecoImp());
  getIt.registerSingleton<IDeleteUsuarioEndereco>(DeleteUsuarioEnderecoImp());
  getIt.registerSingleton<IUsuarioEnderecoRepository>(
      UsuarioEnderecoRepositoryImp());
  getIt.registerSingleton<IUsuarioEnderecoDataSources>(
      UsuarioEnderecoRemoteDataSourcesImp());

  getIt.registerSingleton<IGetUsuarioCarrinho>(GetUsuarioCarrinhoImp());
  getIt.registerSingleton<IAddItemCarrinho>(AddItemCarrinhoImp());
  getIt.registerSingleton<IAtualizarQuantidadeItemCarrinho>(
      AtualizarQuantidadeItemCarrinhoImp());
  getIt.registerSingleton<IDeleteItemCarrinho>(DeleteItemCarrinhoImp());
  getIt.registerSingleton<IUsuarioCarrinhoRepository>(
      UsuarioCarrinhoRepositoryImp());
  getIt.registerSingleton<IUsuarioCarrinhoDataSources>(
      UsuarioCarrinhoRemoteDataSourcesImp());

  getIt.registerSingleton<IGetListaProdutos>(GetListaProdutosImp());
  getIt.registerSingleton<IListaProdutosRepository>(
      ListaProdutosRepositoryApiImp());
  getIt.registerSingleton<IListaProdutosDataSource>(
      ListaProdtutosRemoteDataSourceImp());

  getIt.registerSingleton<IUsuarioBloc>(UsuarioBloc());
}
