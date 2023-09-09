import 'package:cafeteria_app/features/produtos/domain/entities/produtos_entity.dart';

abstract class IGetListaProdutos {
  Future<List<ProdutosEntity>> listaProdutos();
}
