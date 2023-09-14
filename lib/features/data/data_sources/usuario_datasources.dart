import 'package:cafeteria_app/features/data/dtos/usuario_dto.dart';

abstract class IUsuarioDataSources {
  Future<Map<String, String>> getUsuario(
      {required String email, required String senha});

  Future<String> saveUsuario({
    required UsuarioDto usuario,
  });
}
