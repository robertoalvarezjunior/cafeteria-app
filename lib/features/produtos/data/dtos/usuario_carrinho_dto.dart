// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:cafeteria_app/features/produtos/data/dtos/produtos_dto.dart';
import 'package:cafeteria_app/features/produtos/domain/entities/usuario_carrinho_entity.dart';

final class UsuarioCarrinhoDto extends UsuarioCarrinhoEntity {
  final String? id;
  final String idUsuario;
  final int quantidade;
  final ProdutosDto? produto;
  UsuarioCarrinhoDto({
    this.id,
    required this.idUsuario,
    required this.quantidade,
    this.produto,
  }) : super(
          idCarrinho: id,
          idUsuarioCarrinho: idUsuario,
          quantidadeCarrinho: quantidade,
          produtoCarrinho: produto,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idUsuario': idUsuario,
      'quantidade': quantidade,
      'produto': produto?.toMap(),
    };
  }

  factory UsuarioCarrinhoDto.fromMap(Map<String, dynamic> map) {
    return UsuarioCarrinhoDto(
      id: map['id'] != null ? map['id'] as String : null,
      idUsuario: map['idUsuario'] as String,
      quantidade: map['quantidade'] as int,
      produto: map['produto'] != null
          ? ProdutosDto.fromMap(map['produto'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioCarrinhoDto.fromJson(String source) =>
      UsuarioCarrinhoDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
