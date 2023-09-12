abstract class IGetUsuarioDataSources {
  Future<Map<String, dynamic>> getUsuario(
      {required String email, required String senha});
}
