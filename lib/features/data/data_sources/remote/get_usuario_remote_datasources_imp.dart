import 'dart:convert';

import 'package:cafeteria_app/features/data/data_sources/get_usuario_datasources.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:http/http.dart' as http;

final class GetUsuarioDataSourcesImp implements IGetUsuarioDataSources {
  @override
  getUsuario(String email, String senha) async {
    try {
      var url = Uri.parse("http://172.31.32.1:8080/usuario/login");
      http.Response response = await http.post(url, body: <String, String>{
        "email": email,
        "senha": senha,
      });
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var decodeBody = jsonDecode(response.body);
        print(decodeBody);
        return {"token": "token"};
      } else {
        throw CatchError(message: "Falha na conexão");
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }
}
