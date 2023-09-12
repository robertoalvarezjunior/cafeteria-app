import 'dart:convert';

import 'package:cafeteria_app/features/data/data_sources/save_usuario_endereco_datasources.dart';

import 'package:cafeteria_app/features/data/dtos/usuario_endereco_dto.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:http/http.dart' as http;

final class SaveUsuarioEnderecoRemoteDatasourcesimp
    implements ISaveUsuarioEnderecoDataSources {
  @override
  Future<String> saveUsuarioEndereco({
    required String? id,
    required String idUsuario,
    required String rua,
    required String cidade,
    required String estado,
    required String cep,
    required String numero,
    required String? complemento,
    required String bearer,
  }) async {
    try {
      var url = Uri.parse("http://172.31.32.1:8080/usuarioEndereco");
      http.Response response = await http.post(url,
          body: UsuarioEnderecoDto(
                  id: id,
                  idUsuario: idUsuario,
                  rua: rua,
                  cidade: cidade,
                  estado: estado,
                  cep: cep,
                  numero: numero,
                  complemento: complemento)
              .toJson(),
          headers: {"Authorization": "Bearer $bearer"});

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body.toString();
      } else {
        throw CatchError(message: "Falha na conexão");
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }
}
