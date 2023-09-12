import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/data_sources/get_usuario_enderecos_datasource.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';
import 'package:cafeteria_app/features/domain/repositorys/get_usuario_endereco_repository.dart';

final class GetUsuarioEnderecoRepositoryImp
    implements IGetUsuarioEnderecoRepository {
  @override
  Future<List<UsuarioEnderecoEntity>> getUsuarioEndereco(
      {required String idUsuario, required String bearer}) async {
    return getIt<IGetUsuarioEnderecoDataSources>()
        .getUsuarioEnderecos(idUsuario: idUsuario, bearer: bearer);
  }
}
