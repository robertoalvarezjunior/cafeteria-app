import 'package:flutter/material.dart';

import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_repository.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/get_usuario/get_usuario.dart';

final class GetUsuarioImp implements IGetUsuario {
  @override
  getUsuario(BuildContext context,
      {required String email, required String senha}) async {
    await getIt<IUsuarioRepository>()
        .getUsuario(context, email: email, senha: senha);
  }
}
