import 'dart:convert';

import 'package:cafeteria_app/features/data/data_sources/lista_produtos_datasources.dart';
import 'package:cafeteria_app/features/data/dtos/produtos_dto.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';
import 'package:cafeteria_app/features/domain/entities/produtos_entity.dart';
import 'package:http/http.dart' as http;

class ListaProdtutosRemoteDataSourceImp implements IListaProdutosDataSource {
  @override
  Future<List<ProdutosEntity>> listaProdutos() async {
    try {
      var url = Uri.parse("http://10.40.10.55:8080/produtos");
      http.Response response = await http.get(
        url,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        List decodeBody = jsonDecode(response.body);
        return decodeBody.map((e) => ProdutosDto.fromMap(e)).toList();
      } else {
        throw CatchError(message: response.body.toString());
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }
}
