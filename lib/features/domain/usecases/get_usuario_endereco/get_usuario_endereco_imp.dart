import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';
import 'package:cafeteria_app/features/domain/repositorys/get_usuario_endereco_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/get_usuario_endereco/get_usuario_endereco.dart';

final class GetUsuarioEnderecoImp implements IGetUsuarioEndereco {
  @override
  Future<List<UsuarioEnderecoEntity>> getUsuarioEndereco(
      {required String idUsuario, required String bearer}) async {
    return await getIt<IGetUsuarioEnderecoRepository>()
        .getUsuarioEndereco(idUsuario: idUsuario, bearer: bearer);
  }
}
