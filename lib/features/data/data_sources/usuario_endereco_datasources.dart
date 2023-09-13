import 'package:cafeteria_app/features/data/dtos/usuario_endereco_dto.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';

abstract class IUsuarioEnderecoDataSources {
  Future<String> saveUsuarioEndereco({
    required UsuarioEnderecoDto usuarioEndereco,
    required String bearer,
  });

  Future<List<UsuarioEnderecoEntity>> getUsuarioEnderecos(
      {required String idUsuario, required String bearer});

  Future<String> deleteUsuarioEndereco(
      {required String idUsuario, required String bearer});
}
