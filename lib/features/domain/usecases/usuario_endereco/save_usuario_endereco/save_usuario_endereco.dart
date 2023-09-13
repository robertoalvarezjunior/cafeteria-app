import 'package:cafeteria_app/features/data/dtos/usuario_endereco_dto.dart';

abstract class ISaveUsuarioEndereco {
  Future<String> saveUsuarioEndereco({
    required UsuarioEnderecoDto usuarioEndereco,
    required String bearer,
  });
}
