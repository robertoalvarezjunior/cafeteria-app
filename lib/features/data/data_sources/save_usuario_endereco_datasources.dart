abstract class ISaveUsuarioEnderecoDataSources {
  Future<String> saveUsuarioEndereco({
    required String? id,
    required String idUsuario,
    required String rua,
    required String cidade,
    required String estado,
    required String cep,
    required String numero,
    required String? complemento,
    required String bearer,
  });
}
