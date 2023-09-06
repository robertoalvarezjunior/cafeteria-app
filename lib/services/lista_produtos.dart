import 'dart:convert';

import 'package:cafeteria_app/models/error.dart';
import 'package:cafeteria_app/models/produtos_model.dart';
import 'package:cafeteria_app/services/abstracts/i_lista_produtos.dart';
import 'package:http/http.dart' as http;

final class ListaProdutosImp extends IListaProdutos {
  @override
  Future<List<ProdutosModel>> listaProdutos() async {
    try {
      var url = Uri.parse("http://localhost:8080/produtos");
      http.Response response = await http.get(url);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        List decodeBody = jsonDecode(response.body);

        return decodeBody.map((e) => ProdutosModel.fromMap(e)).toList();
      } else {
        throw Exception("Falha na conexão");
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }
}
