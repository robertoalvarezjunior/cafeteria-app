import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';

class UsuarioCarrinhoEntity {
  final String? idCarrinho;
  final String idUsuarioCarrinho;
  final int quantidadeCarrinho;
  final ProdutosEntity? produtoCarrinho;
  UsuarioCarrinhoEntity({
    this.idCarrinho,
    required this.idUsuarioCarrinho,
    required this.quantidadeCarrinho,
    this.produtoCarrinho,
  });
}
