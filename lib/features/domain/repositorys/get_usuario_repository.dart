abstract class IGetUsuarioRepository {
  Future<Map<String, dynamic>> getUsuario(
      {required String email, required String senha});
}
