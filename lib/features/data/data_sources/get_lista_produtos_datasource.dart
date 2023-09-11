import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';

abstract class IGetListaProdutosDataSource {
  Future<List<ProdutosEntity>> listaProdutos();
}
