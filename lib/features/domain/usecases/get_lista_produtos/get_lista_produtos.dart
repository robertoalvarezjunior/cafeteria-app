import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';

abstract class IGetListaProdutos {
  Future<List<ProdutosEntity>> listaProdutos();
}
