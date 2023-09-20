import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:cafeteria_app/core/local_storage/usuario_infos_bloc.dart';
import 'package:cafeteria_app/features/data/data_sources/usuario_datasources.dart';
import 'package:cafeteria_app/features/data/dtos/usuario_dto.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';

final class UsuarioDataSourcesImp implements IUsuarioDataSources {
  @override
  getUsuario(BuildContext context,
      {required String email, required String senha}) async {
    var url = Uri.parse("http://10.40.10.55:8080/usuario/login/$email/$senha");
    http.post(url).then((http.Response response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var body = jsonDecode(response.body);
        IUsuarioInfosBloc salvarUsuarioInfosBloc = UsuarioInfosBloc();
        salvarUsuarioInfosBloc.add(SalvarUsuarioInfosEvent(
            usuario: body["usuario"], token: body["token"]));
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response.body.toString(),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }).catchError((e) {
      throw CatchError(message: e.toString());
    });
  }

  @override
  saveUsuario(BuildContext context, {required UsuarioDto usuario}) async {
    var url = Uri.parse("http://10.40.10.55:8080/usuario/cadastro");

    try {
      http.Response response = await http.post(url, body: usuario.toJson());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body.toString();
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        return response.body.toString();
      } else {
        throw CatchError(message: response.body.toString());
      }
    } catch (e) {
      throw CatchError(message: e.toString());
    }
  }
}
