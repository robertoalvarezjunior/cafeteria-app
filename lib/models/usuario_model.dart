// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:cafeteria_app/models/produtos_model.dart';
import 'package:cafeteria_app/models/usuario_endereco_model.dart';

class UsuarioModel {
  final String? id;
  final String email;
  final String senha;
  final String nome;
  final String numeroTelefone;
  final List<UsuarioEnderecoModel>? enderecos;
  final List<ProdutosModel>? carrinho;
  UsuarioModel({
    this.id,
    required this.email,
    required this.senha,
    required this.nome,
    required this.numeroTelefone,
    this.enderecos,
    this.carrinho,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'senha': senha,
      'nome': nome,
      'numeroTelefone': numeroTelefone,
      'enderecos': enderecos?.map((x) => x.toMap()).toList(),
      'carrinho': carrinho?.map((x) => x.toMap()).toList(),
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'] != null ? map['id'] as String : null,
      email: map['email'] as String,
      senha: map['senha'] as String,
      nome: map['nome'] as String,
      numeroTelefone: map['numeroTelefone'] as String,
      enderecos: map['enderecos'] != null
          ? List<UsuarioEnderecoModel>.from(
              (map['enderecos'] as List<int>).map<UsuarioEnderecoModel?>(
                (x) => UsuarioEnderecoModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      carrinho: map['carrinho'] != null
          ? List<ProdutosModel>.from(
              (map['carrinho'] as List<int>).map<ProdutosModel?>(
                (x) => ProdutosModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
