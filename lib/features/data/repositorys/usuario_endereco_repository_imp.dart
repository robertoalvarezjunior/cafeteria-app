import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/data_sources/usuario_endereco_datasources.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_endereco_dto.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_endereco_repository.dart';

final class UsuarioEnderecoRepositoryImp implements IUsuarioEnderecoRepository {
  @override
  Future<String> deleteUsuarioEndereco(
      {required String idUsuario, required String bearer}) {
    return getIt<IUsuarioEnderecoDataSources>()
        .deleteUsuarioEndereco(idUsuario: idUsuario, bearer: bearer);
  }

  @override
  Future<List<UsuarioEnderecoEntity>> getUsuarioEndereco(
      {required String idUsuario, required String bearer}) {
    return getIt<IUsuarioEnderecoDataSources>()
        .getUsuarioEnderecos(idUsuario: idUsuario, bearer: bearer);
  }

  @override
  Future<String> saveUsuariosEndereco(
      {required UsuarioEnderecoDto usuarioEndereco, required String bearer}) {
    return getIt<IUsuarioEnderecoDataSources>()
        .saveUsuarioEndereco(usuarioEndereco: usuarioEndereco, bearer: bearer);
  }
}
