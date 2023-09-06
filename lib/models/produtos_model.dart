import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProdutosModel {
  final String id;
  final String nome;
  final double preco;
  final String imagem;
  final String tag;
  ProdutosModel({
    required this.id,
    required this.nome,
    required this.preco,
    required this.imagem,
    required this.tag,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'preco': preco,
      'imagem': imagem,
      'tag': tag,
    };
  }

  factory ProdutosModel.fromMap(Map<String, dynamic> map) {
    return ProdutosModel(
      id: map['id'] as String,
      nome: map['nome'] as String,
      preco: map['preco'] as double,
      imagem: map['imagem'] as String,
      tag: map['tag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutosModel.fromJson(String source) =>
      ProdutosModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
