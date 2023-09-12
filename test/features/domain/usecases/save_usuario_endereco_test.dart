import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/domain/usecases/save_usuario_endereco/save_usuario_endereco.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  getItSetup();
  test('salvar endereco ususario', () async {
    var salvarEndereco = await getIt<ISaveUsuarioEndereco>().saveUsuarioEndereco(
        id: null,
        idUsuario: "c5adf1ba-aee7-4e3d-95e3-f43d4140a679",
        rua: 'rua teste',
        cidade: 'cidade teste',
        estado: 'estado teste',
        cep: '88888888',
        numero: 'numero teste',
        complemento: 'complemento teste',
        bearer:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhY2Nlc3NUb2tlbiIsImlzcyI6Imlzc3VlciIsImV4cCI6MTY5NDYwNTg4OCwiZW1haWwiOiJ0ZXN0ZUB0ZXN0ZS5jb20ifQ.4Jxyrn00st4iTkRCoidiuTKT-wkdvlA8fz1VHkxn300');

    expect(salvarEndereco, 'Endereço adicionado');
  });
}
