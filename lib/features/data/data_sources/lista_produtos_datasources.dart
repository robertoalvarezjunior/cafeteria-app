import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';

abstract class IListaProdutosDataSource {
  Future<List<ProdutosEntity>> listaProdutos();
}
