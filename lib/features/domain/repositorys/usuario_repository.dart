import 'package:flutter/material.dart';

import 'package:cafeteria_app/features/data/dtos/usuario_dto.dart';

abstract class IUsuarioRepository {
  Future<void> getUsuario(BuildContext context,
      {required String email, required String senha});

  Future saveUsuario(
    BuildContext context, {
    required UsuarioDto usuario,
  });
}
