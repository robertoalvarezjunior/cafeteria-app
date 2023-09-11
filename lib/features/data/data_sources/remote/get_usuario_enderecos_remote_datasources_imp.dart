import 'dart:convert';

import 'package:cafeteria_app/features/data/data_sources/get_usuario_enderecos_datasource.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_endereco_dto.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_endereco_entity.dart';

import 'package:http/http.dart' as http;

final class GetUsuarioEnderecosRemoteDataSourcesImp
    implements IGetUsuarioEnderecoDataSources {
  @override
  Future<List<UsuarioEnderecoEntity>> getUsuarioEnderecos() async {
    try {
      var url = Uri.parse("http://192.168.1.50:8080/usuarioEndereco");
      http.Response response = await http.get(url, headers: {
        "Accept": "application/json",
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
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
}
