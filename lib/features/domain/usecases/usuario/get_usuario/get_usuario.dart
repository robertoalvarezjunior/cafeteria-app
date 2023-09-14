abstract class IGetUsuario {
  Future<Map<String, String>> getUsuario(
      {required String email, required String senha});
}
