import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/usecases/usuario_endereco/delete_usuario_endereco/delete_usuario_endereco.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  getItSetup();
  test('delete endereco', () async {
    var delete = await getIt<IDeleteUsuarioEndereco>().deleteUsuarioEndereco(
        idEndereco: '6a63d82a-c0ce-4ce5-8b92-2a05184c84c4',
        bearer:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhY2Nlc3NUb2tlbiIsImlzcyI6Imlzc3VlciIsImV4cCI6MTY5NDY3NjI3NywiZW1haWwiOiJ0ZXN0ZUB0ZXN0ZS5jb20ifQ.lYJamD48qxwtVI6Ar_kTB-Pvlu5kUodAqCJ8Kvu35aI');

    expect(delete, 'Endereço removido');
  });
}
