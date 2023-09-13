// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cafeteria_app/features/domain/entities/usuario_entity.dart';

class UsuarioDto extends UsuarioEntity {
  final String? idUsuario;
  final String email;
  final String senha;
  final String nome;
  final String numeroTelefone;

  UsuarioDto({
    this.idUsuario,
    required this.email,
    required this.senha,
    required this.nome,
    required this.numeroTelefone,
  }) : super(
          idUsuarioUsuario: idUsuario,
          emailUsuario: email,
          senhaUsuario: senha,
          nomeUsuario: nome,
          numeroTelefoneUsuario: numeroTelefone,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUsuario': idUsuario,
      'email': email,
      'senha': senha,
      'nome': nome,
      'numeroTelefone': numeroTelefone,
    };
  }

  factory UsuarioDto.fromMap(Map<String, dynamic> map) {
    return UsuarioDto(
      idUsuario: map['idUsuario'] != null ? map['idUsuario'] as String : null,
      email: map['email'] as String,
      senha: map['senha'] as String,
      nome: map['nome'] as String,
      numeroTelefone: map['numeroTelefone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioDto.fromJson(String source) =>
      UsuarioDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
