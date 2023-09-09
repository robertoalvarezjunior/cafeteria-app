import 'dart:convert';

import 'package:cafeteria_app/features/produtos/data/data_sources/get_lista_produtos_datasource.dart';
import 'package:cafeteria_app/features/produtos/data/dtos/produtos_dto.dart';
import 'package:cafeteria_app/features/produtos/domain/entities/error.dart';
import 'package:cafeteria_app/features/produtos/domain/entities/produtos_entity.dart';

import 'package:http/http.dart' as http;

class GetListaProdtutosRemoteDataSourceImp
    implements IGetListaProdutosDataSource {
  @override
  Future<List<ProdutosEntity>> listaProdutos() async {
    try {
      var url = Uri.parse("http://192.168.1.50:8080/produtos");
      http.Response response = await http.get(url);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        List decodeBody = jsonDecode(response.body);

        return decodeBody.map((e) => ProdutosDto.fromMap(e)).toList();
      } else {
        throw CatchError(message: "Falha na conexão");
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }
}
