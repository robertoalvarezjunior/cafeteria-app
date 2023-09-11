import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';

abstract class IGetUsuarioEnderecoRepository {
  Future<List<UsuarioEnderecoEntity>> getUsuarioEndereco();
}
