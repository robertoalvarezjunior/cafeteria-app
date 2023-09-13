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
      var url = Uri.parse("http://172.31.32.1:8080/produtos");
      http.Response response = await http.get(
        url,
      );

      List decodeBody = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return decodeBody.map((e) => ProdutosDto.fromMap(e)).toList();
      } else {
        throw CatchError(message: decodeBody.toString());
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }
}
