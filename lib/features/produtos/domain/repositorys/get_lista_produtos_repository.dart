import 'package:cafeteria_app/features/produtos/domain/entities/produtos_entity.dart';

abstract class IGetListaProdutosRepository {
  Future<List<ProdutosEntity>> listaProdutos();
}
