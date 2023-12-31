import 'package:cafeteria_app/features/domain/entities/usuario_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('usuario entity', () {
    UsuarioEntity usuario = UsuarioEntity(
      idUsuarioUsuario: "idUsuario",
      nomeUsuario: "nomeUsuario",
      emailUsuario: "emailUsuario",
      senhaUsuario: "senhaUsuario",
      numeroTelefoneUsuario: 'numeroTelefoneUsuario',
    );
    expect(usuario, isNotNull);
  });
}
