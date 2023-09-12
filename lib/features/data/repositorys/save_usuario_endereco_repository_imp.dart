import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/data_sources/save_usuario_endereco_datasources.dart';
import 'package:cafeteria_app/features/domain/repositorys/save_ususario_endereco_repository.dart';

final class SaveUsuarioEnderecoRepositoryImp
    implements ISaveUsuarioEnderecoRepository {
  @override
  Future<String> saveUsuariosEndereco({
    required String? id,
    required String idUsuario,
    required String rua,
    required String cidade,
    required String estado,
    required String cep,
    required String numero,
    required String? complemento,
    required String bearer,
  }) {
    return getIt<ISaveUsuarioEnderecoDataSources>().saveUsuarioEndereco(
        id: id,
        idUsuario: idUsuario,
        rua: rua,
        cidade: cidade,
        estado: estado,
        cep: cep,
        numero: numero,
        complemento: complemento,
        bearer: bearer);
  }
}
