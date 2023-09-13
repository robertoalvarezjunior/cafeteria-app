import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/data_sources/usuario_datasources.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_dto.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_repository.dart';

final class UsuarioRepositoryImp implements IUsuarioRepository {
  @override
  getUsuario({required String email, required String senha}) {
    return getIt<IUsuarioDataSources>().getUsuario(email: email, senha: senha);
  }

  @override
  Future<String> saveUsuario({required UsuarioDto usuario}) {
    return getIt<IUsuarioDataSources>().saveUsuario(usuario: usuario);
  }
}
