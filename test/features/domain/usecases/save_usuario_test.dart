import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_dto.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario/save_usuario/save_usuario.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  getItSetup();
  test('usuario criado', () async {
    var usuario = UsuarioDto(
      idUsuario: null,
      email: 'teste3.test@teste.com',
      senha: '123456',
      nome: 'roberto',
      numeroTelefone: '61 12345 6789',
    );

    var result = await getIt<ISaveUsuario>().saveUsuario(usuario: usuario);
    expect(result, isInstanceOf<CatchError>());
  });
}
