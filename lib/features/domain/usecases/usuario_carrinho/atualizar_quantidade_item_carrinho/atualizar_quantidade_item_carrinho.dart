abstract class IAtualizarQuantidadeItemCarrinho {
  Future<String> atualizarQuantidadeItemCarrinho(
      {required String id, required int quantidade, required String bearer});
}
