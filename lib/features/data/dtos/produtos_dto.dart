import 'dart:convert';

import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';

final class ProdutosDto extends ProdutosEntity {
  final String id;
  final String nome;
  final double preco;
  final String imagem;
  final String tag;

  ProdutosDto(
      {required this.id,
      required this.nome,
      required this.preco,
      required this.imagem,
      required this.tag})
      : super(
          idProduto: id,
          nomeProduto: nome,
          precoProduto: preco,
          imagemProduto: imagem,
          tagProduto: tag,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'preco': preco,
      'imagem': imagem,
      'tag': tag,
    };
  }

  factory ProdutosDto.fromMap(Map<String, dynamic> map) {
    return ProdutosDto(
      id: map['id'] as String,
      nome: map['nome'] as String,
      preco: map['preco'] as double,
      imagem: map['imagem'] as String,
      tag: map['tag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutosDto.fromJson(String source) =>
      ProdutosDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
