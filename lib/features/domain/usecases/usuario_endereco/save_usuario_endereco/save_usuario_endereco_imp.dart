import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_endereco_dto.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_endereco_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/save_usuario_endereco/save_usuario_endereco.dart';

final class SaveUsuarioEnderecoImp implements ISaveUsuarioEndereco {
  @override
  Future<String> saveUsuarioEndereco({
    required UsuarioEnderecoDto usuarioEndereco,
    required String bearer,
  }) async {
    return await getIt<IUsuarioEnderecoRepository>().saveUsuariosEndereco(
      usuarioEndereco: usuarioEndereco,
      bearer: bearer,
    );
  }
}
