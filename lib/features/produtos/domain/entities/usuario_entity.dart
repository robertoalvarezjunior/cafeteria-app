// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cafeteria_app/features/produtos/domain/entities/produtos_entity.dart';
import 'package:cafeteria_app/features/produtos/domain/entities/usuario_endereco_entity.dart';

class UsuarioEntity {
  final String? idUsuarioUsuario;
  final String emailUsuario;
  final String senhaUsuario;
  final String nomeUsuario;
  final String numeroTelefoneUsuario;
  final List<UsuarioEnderecoEntity>? enderecosUsuario;
  final List<ProdutosEntity>? carrinhoUsuario;
  UsuarioEntity({
    this.idUsuarioUsuario,
    required this.emailUsuario,
    required this.senhaUsuario,
    required this.nomeUsuario,
    required this.numeroTelefoneUsuario,
    this.enderecosUsuario,
    this.carrinhoUsuario,
  });
}
