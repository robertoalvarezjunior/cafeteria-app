import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/repositorys/get_usuario_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/get_usuario/get_usuario.dart';

final class GetUsuarioImp implements IGetUsuario {
  @override
  getUsuario(String email, String senha) async {
    return await getIt<IGetUsuarioRepository>().getUsuario(email, senha);
  }
}
