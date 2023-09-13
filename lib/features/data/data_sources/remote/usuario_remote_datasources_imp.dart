import 'dart:convert';

import 'package:cafeteria_app/features/data/data_sources/usuario_datasources.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_dto.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:http/http.dart' as http;

final class UsuarioDataSourcesImp implements IUsuarioDataSources {
  @override
  getUsuario({required String email, required String senha}) async {
    try {
      var url =
          Uri.parse("http://172.31.32.1:8080/usuario/login/$email/$senha");
      http.Response response = await http.post(url);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var body = jsonDecode(response.body);
        return {
          "token": body["token"],
          "usuario": body["usuario"],
        };
      } else {
        throw CatchError(message: "Falha na conexão");
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }

  @override
  Future<String> saveUsuario({required UsuarioDto usuario}) async {
    try {
      var url = Uri.parse("http://172.31.32.1:8080/usuario/cadastro");
      http.Response response = await http.post(url, body: usuario.toJson());

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
