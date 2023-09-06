import '../../models/produtos_model.dart';

abstract class IListaProdutosRepository {
  Future<List<ProdutosModel>> listaProdutos();
}
