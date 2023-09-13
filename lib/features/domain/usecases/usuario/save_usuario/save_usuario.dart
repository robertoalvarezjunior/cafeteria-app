import 'package:cafeteria_app/features/data/dtos/usuario_dto.dart';

abstract class ISaveUsuario {
  Future<String> saveUsuario({
    required UsuarioDto usuario,
  });
}
