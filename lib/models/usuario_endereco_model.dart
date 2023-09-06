import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UsuarioEnderecoModel {
  final String? id;
  final String rua;
  final String cidade;
  final String estado;
  final String cep;
  final String numero;
  final String? complemento;
  UsuarioEnderecoModel({
    this.id,
    required this.rua,
    required this.cidade,
    required this.estado,
    required this.cep,
    required this.numero,
    this.complemento,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'rua': rua,
      'cidade': cidade,
      'estado': estado,
      'cep': cep,
      'numero': numero,
      'complemento': complemento,
    };
  }

  factory UsuarioEnderecoModel.fromMap(Map<String, dynamic> map) {
    return UsuarioEnderecoModel(
      id: map['id'] != null ? map['id'] as String : null,
      rua: map['rua'] as String,
      cidade: map['cidade'] as String,
      estado: map['estado'] as String,
      cep: map['cep'] as String,
      numero: map['numero'] as String,
      complemento:
          map['complemento'] != null ? map['complemento'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioEnderecoModel.fromJson(String source) =>
      UsuarioEnderecoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
