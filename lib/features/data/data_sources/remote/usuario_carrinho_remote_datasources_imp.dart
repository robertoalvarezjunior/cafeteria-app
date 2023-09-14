import 'dart:convert';

import 'package:cafeteria_app/features/data/data_sources/usuario_carrinho_datasources.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_carrinho_dto.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:cafeteria_app/features/domain/entities/usuario_carrinho_entity.dart';
import 'package:http/http.dart' as http;

final class UsuarioCarrinhoRemoteDataSourcesImp
    implements IUsuarioCarrinhoDataSources {
  @override
  Future<String> adicionarItemCarrinho(
      {required UsuarioCarrinhoDto usuarioCarrinho,
      required String bearer}) async {
    try {
      var url = Uri.parse("http://10.40.10.55:8080/usuarioCarrinho");

      http.Response response = await http.post(url,
          body: usuarioCarrinho.toJson(),
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $bearer"
          });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body.toString();
      } else {
        throw CatchError(message: response.body.toString());
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }

  @override
  Future<String> atualizarQuantidadeItemCarrinho(
      {required String id,
      required int quantidade,
      required String bearer}) async {
    try {
      var url =
          Uri.parse("http://10.40.10.55:8080/usuarioCarrinho/$id/$quantidade");

      http.Response response = await http.put(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer'
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body.toString();
      } else {
        throw CatchError(message: response.body.toString());
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }

  @override
  Future<List<UsuarioCarrinhoEntity>> getUsuarioCarrinho(
      {required String idUsuario, required String bearer}) async {
    try {
      var url = Uri.parse("http://10.40.10.55:8080/usuarioCarrinho/$idUsuario");

      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer'
      });
      List body = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return body.map((e) => UsuarioCarrinhoDto.fromMap(e)).toList();
      } else {
        throw CatchError(message: body.toString());
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }

  @override
  Future<String> deleteItemCarrinho(
      {required String id, required String bearer}) async {
    try {
      var url = Uri.parse("http://10.40.10.55:8080/usuarioCarrinho/$id");

      http.Response response = await http.delete(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer'
      });

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
