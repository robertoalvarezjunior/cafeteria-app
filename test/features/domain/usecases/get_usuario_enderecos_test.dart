import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/get_usuario_endereco/get_usuario_endereco.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  getItSetup();
  test('Lista de endereços de usuario', () async {
    var endereco = await getIt<IGetUsuarioEndereco>().getUsuarioEndereco(
        idUsuario: 'c5adf1ba-aee7-4e3d-95e3-f43d4140a679',
        bearer:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhY2Nlc3NUb2tlbiIsImlzcyI6Imlzc3VlciIsImV4cCI6MTY5NDY3NjI3NywiZW1haWwiOiJ0ZXN0ZUB0ZXN0ZS5jb20ifQ.lYJamD48qxwtVI6Ar_kTB-Pvlu5kUodAqCJ8Kvu35aI');

    expect(endereco, isInstanceOf<List<UsuarioEnderecoEntity>>());
  });
}
