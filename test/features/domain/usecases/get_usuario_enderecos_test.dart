import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';
import 'package:cafeteria_app/features/domain/usecases/get_usuario_endereco/get_usuario_endereco.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  getItSetup();
  test('Lista de endereços de usuario', () async {
    var endereco = await getIt<IGetUsuarioEndereco>().getUsuarioEndereco(
        idUsuario: 'c5adf1ba-aee7-4e3d-95e3-f43d4140a679',
        bearer:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhY2Nlc3NUb2tlbiIsImlzcyI6Imlzc3VlciIsImV4cCI6MTY5NDU0MTA4NiwiZW1haWwiOiJ0ZXN0ZUB0ZXN0ZS5jb20ifQ.6RiNCcniT2Sits8ohPk62N-V4VmoOIsG_NIBM9d_Qu4');

    expect(endereco, isInstanceOf<List<UsuarioEnderecoEntity>>());
  });
}
