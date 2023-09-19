import 'package:flutter/material.dart';

import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/data_sources/usuario_datasources.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_dto.dart';
import 'package:cafeteria_app/features/domain/repositorys/usuario_repository.dart';

final class UsuarioRepositoryImp implements IUsuarioRepository {
  @override
  getUsuario(BuildContext context,
      {required String email, required String senha}) async {
    getIt<IUsuarioDataSources>()
        .getUsuario(context, email: email, senha: senha);
  }

  @override
  saveUsuario(BuildContext context, {required UsuarioDto usuario}) async {
    return getIt<IUsuarioDataSources>().saveUsuario(context, usuario: usuario);
  }
}
