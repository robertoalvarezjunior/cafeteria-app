import 'package:flutter/material.dart';

import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_dto.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/save_usuario/save_usuario.dart';

final class SaveUsuarioImp implements ISaveUsuario {
  @override
  saveUsuario(BuildContext context, {required UsuarioDto usuario}) async {
    return await getIt<IUsuarioRepository>()
        .saveUsuario(context, usuario: usuario);
  }
}
