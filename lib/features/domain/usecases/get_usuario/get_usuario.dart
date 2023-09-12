abstract class IGetUsuario {
  Future<Map<String, dynamic>> getUsuario(
      {required String email, required String senha});
}
