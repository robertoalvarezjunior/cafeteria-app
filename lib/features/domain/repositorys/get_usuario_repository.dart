abstract class IGetUsuarioRepository {
  Future<Map<String, dynamic>> getUsuario(String email, String senha);
}
