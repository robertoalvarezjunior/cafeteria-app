import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';

abstract class ISaveUsuarioEndereco {
  Future<void> saveUsuarioEndereco(UsuarioEnderecoEntity usuarioEnderecoEntity);
}
