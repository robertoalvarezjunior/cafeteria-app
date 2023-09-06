import 'package:cafeteria_app/models/produtos_model.dart';

abstract class IListaProdutos {
  Future<List<ProdutosModel>> listaProdutos();
}
