// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cafeteria_app/features/produtos/domain/entities/produtos_entity.dart';

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
