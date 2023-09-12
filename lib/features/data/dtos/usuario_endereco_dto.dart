// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';

class UsuarioEnderecoDto extends UsuarioEnderecoEntity {
  final String? id;
  final String? idUsuario;
  final String? rua;
  final String? cidade;
  final String? estado;
  final String? cep;
  final String? numero;
  final String? complemento;

  UsuarioEnderecoDto({
    this.id,
    this.idUsuario,
    this.rua,
    this.cidade,
    this.estado,
    this.cep,
    this.numero,
    this.complemento,
  }) : super(
          idUsuarioEndereco: id,
          ruaUsuarioEndereco: rua,
          cidadeUsuarioEndereco: cidade,
          estadoUsuarioEnderecUsuaro: estado,
          cepUsuarioEndereco: cep,
          numeroUsuarioEndereco: numero,
          complementoUsuarioEndereco: complemento,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idUsuario': idUsuario,
      'rua': rua,
      'cidade': cidade,
      'estado': estado,
      'cep': cep,
      'numero': numero,
      'complemento': complemento,
    };
  }

  factory UsuarioEnderecoDto.fromMap(Map<String, dynamic> map) {
    return UsuarioEnderecoDto(
      id: map['id'] != null ? map['id'] as String : null,
      idUsuario: map['idUsuario'] != null ? map['idUsuario'] as String : null,
      rua: map['rua'] != null ? map['rua'] as String : null,
      cidade: map['cidade'] != null ? map['cidade'] as String : null,
      estado: map['estado'] != null ? map['estado'] as String : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
      numero: map['numero'] != null ? map['numero'] as String : null,
      complemento:
          map['complemento'] != null ? map['complemento'] as String : null,
    );
  }

  factory UsuarioEnderecoDto.fromJson(String source) =>
      UsuarioEnderecoDto.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
