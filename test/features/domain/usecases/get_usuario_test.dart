import 'dart:convert';

import 'package:cafeteria_app/features/domain/usecases/usuario/get_usuario/get_usuario.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cafeteria_app/core/utils/getit_setup.dart';

void main() {
  getItSetup();

  test('retornar usuario', () async {
    var usuario = await getIt<IGetUsuario>()
        .getUsuario(email: "teste@teste.com", senha: "1234");
    expect(jsonDecode(usuario['usuario']), jsonDecode(usuario['usuario']));
  });
}
