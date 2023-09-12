import 'dart:convert';

import 'package:cafeteria_app/features/data/data_sources/get_usuario_enderecos_datasource.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_endereco_dto.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';

import 'package:http/http.dart' as http;

final class GetUsuarioEnderecosRemoteDataSourcesImp
    implements IGetUsuarioEnderecoDataSources {
  @override
  getUsuarioEnderecos(
      {required String idUsuario, required String bearer}) async {
    try {
      var url = Uri.parse("http://172.31.32.1:8080/usuarioEndereco/$idUsuario");
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
}
