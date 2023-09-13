import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/get_usuario/get_usuario.dart';

final class GetUsuarioImp implements IGetUsuario {
  @override
  getUsuario({required String email, required String senha}) async {
    return await getIt<IUsuarioRepository>()
        .getUsuario(email: email, senha: senha);
  }
}
