import 'package:flutter/material.dart';

import 'package:cafeteria_app/features/data/dtos/usuario_dto.dart';

abstract class ISaveUsuario {
  Future saveUsuario(
    BuildContext context, {
    required UsuarioDto usuario,
  });
}
