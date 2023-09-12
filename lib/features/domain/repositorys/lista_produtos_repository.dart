import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';

abstract class IListaProdutosRepository {
  Future<List<ProdutosEntity>> listaProdutos();
}
