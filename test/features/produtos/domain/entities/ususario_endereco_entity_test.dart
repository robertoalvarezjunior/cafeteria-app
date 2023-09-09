import 'package:cafeteria_app/features/produtos/domain/entities/usuario_endereco_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('usuarioEndereco entity', () {
    UsuarioEnderecoEntity usuarioendereco = UsuarioEnderecoEntity(
      ruaUsuarioEndereco: 'ruaUsuarioEndereco',
      cidadeUsuarioEndereco: 'cidadeUsuarioEndereco',
      estadoUsuarioEnderecUsuaro: 'estadoUsuarioEnderecUsuaro',
      cepUsuarioEndereco: 'cepUsuarioEndereco',
      numeroUsuarioEndereco: 'numeroUsuarioEndereco',
    );

    expect(usuarioendereco, isNotNull);
  });
}
