import 'dart:convert';

import 'package:cafeteria_app/features/data/data_sources/usuario_endereco_datasources.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_endereco_dto.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';
import 'package:http/http.dart' as http;

final class UsuarioEnderecoRemoteDataSourcesImp
    implements IUsuarioEnderecoDataSources {
  @override
  Future<String> deleteUsuarioEndereco(
      {required String idUsuario, required String bearer}) async {
    try {
      var url = Uri.parse("http://10.40.10.55:8080/usuarioEndereco/$idUsuario");

      http.Response response = await http.delete(url, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $bearer"
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body.toString();
      } else {
        throw CatchError(message: "Falha na conexão");
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }

  @override
  Future<List<UsuarioEnderecoEntity>> getUsuarioEnderecos(
      {required String idUsuario, required String bearer}) async {
    try {
      var url = Uri.parse("http://10.40.10.55:8080/usuarioEndereco/$idUsuario");
      http.Response response = await http.get(url, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $bearer"
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        List decodeBody = jsonDecode(response.body);

        return decodeBody.map((e) => UsuarioEnderecoDto.fromMap(e)).toList();
      } else {
        throw CatchError(message: "Falha na conexão");
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }

  @override
  Future<String> saveUsuarioEndereco({
    required UsuarioEnderecoDto usuarioEndereco,
    required String bearer,
  }) async {
    try {
      var url = Uri.parse("http://10.40.10.55:8080/usuarioEndereco");
      http.Response response = await http.post(url,
          body: usuarioEndereco.toJson(),
          headers: {"Authorization": "Bearer $bearer"});

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body.toString();
      } else {
        throw CatchError(message: response.body.toString());
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }
}
