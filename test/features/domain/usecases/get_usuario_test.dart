import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:cafeteria_app/core/utils/getit_setup.dart';
import 'package:cafeteria_app/features/data/data_sources/get_usuario_datasources.dart';
import 'package:cafeteria_app/features/domain/entities/error.dart';

class UserTest {
  String token;
  UserTest({
    required this.token,
  });

  UserTest copyWith({
    String? token,
  }) {
    return UserTest(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory UserTest.fromMap(Map<String, dynamic> map) {
    return UserTest(
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTest.fromJson(String source) =>
      UserTest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserTest(token: $token)';

  @override
  bool operator ==(covariant UserTest other) {
    if (identical(this, other)) return true;

    return other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}

class GetUsuarioDataSourcesImpTest implements IGetUsuarioDataSources {
  @override
  getUsuario(String email, String senha) async {
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
}

void main() {
  getItSetup();

  test('retornar usuario', () async {
    var usuario = await GetUsuarioDataSourcesImpTest()
        .getUsuario("teste@teste.com", "1234");
    print(jsonDecode(usuario['usuario'])['email']);
    expect(jsonDecode(usuario['usuario']), jsonDecode(usuario['usuario']));
  });
}
