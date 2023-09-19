import 'package:flutter/material.dart';

abstract class IGetUsuario {
  Future<void> getUsuario(BuildContext context,
      {required String email, required String senha});
}
