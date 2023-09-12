import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';

abstract class IGetUsuarioEndereco {
  Future<List<UsuarioEnderecoEntity>> getUsuarioEndereco(
      {required String idUsuario, required String bearer});
}
