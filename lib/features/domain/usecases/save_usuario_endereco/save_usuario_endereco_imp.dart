import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/repositorys/save_ususario_endereco_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/save_usuario_endereco/save_usuario_endereco.dart';

final class SaveUsuarioEnderecoImp implements ISaveUsuarioEndereco {
  @override
  Future<String> saveUsuarioEndereco({
    required String? id,
    required String idUsuario,
    required String rua,
    required String cidade,
    required String estado,
    required String cep,
    required String numero,
    required String? complemento,
    required String bearer,
  }) async {
    return await getIt<ISaveUsuarioEnderecoRepository>().saveUsuariosEndereco(
      id: id,
      idUsuario: idUsuario,
      rua: rua,
      cidade: cidade,
      estado: estado,
      cep: cep,
      numero: numero,
      complemento: complemento,
      bearer: bearer,
    );
  }
}
