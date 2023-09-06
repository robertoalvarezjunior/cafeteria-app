import 'package:cafeteria_app/models/produtos_model.dart';
import 'package:cafeteria_app/repository/abstracts/i_lista_produtos_repository.dart';
import 'package:cafeteria_app/services/abstracts/i_lista_produtos.dart';

import '../services/lista_produtos.dart';

final class ListaProdutosRepository extends IListaProdutosRepository {
  final IListaProdutos _listaProdutos = ListaProdutosImp();

  @override
  Future<List<ProdutosModel>> listaProdutos() {
    return _listaProdutos.listaProdutos();
  }
}
