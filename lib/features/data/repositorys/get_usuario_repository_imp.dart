import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/data_sources/get_usuario_datasources.dart';
import 'package:cafeteria_app/features/domain/repositorys/get_usuario_repository.dart';

final class GetUsuarioRepositoryImp implements IGetUsuarioRepository {
  @override
  getUsuario({required String email, required String senha}) {
    return getIt<IGetUsuarioDataSources>()
        .getUsuario(email: email, senha: senha);
  }
}
