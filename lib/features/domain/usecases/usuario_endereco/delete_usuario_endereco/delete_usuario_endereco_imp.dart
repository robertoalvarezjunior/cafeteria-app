import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_endereco_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/delete_usuario_endereco/delete_usuario_endereco.dart';

final class DeleteUsuarioEnderecoImp implements IDeleteUsuarioEndereco {
  @override
  Future<String> deleteUsuarioEndereco(
      {required String idUsuario, required String bearer}) async {
    return await getIt<IUsuarioEnderecoRepository>()
        .deleteUsuarioEndereco(idUsuario: idUsuario, bearer: bearer);
  }
}
