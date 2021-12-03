// To parse this JSON data, do
//
//  final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_movil_estudiante/models/estudiante.dart';
//import 'package:app_movil_estudiante/models/oficial.dart';
import 'package:app_movil_estudiante/models/persona.dart';
import 'package:app_movil_estudiante/models/usuario.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.ok,
    this.usuario,
    this.persona,
    this.estudiante,
    this.token,
  });

  bool ok;
  Usuario usuario;
  Persona persona;
  Estudiante estudiante;
  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        persona: Persona.fromJson(json["persona"]),
        estudiante: Estudiante.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "persona": persona.toJson(),
        "civil": estudiante.toJson(),
        "token": token,
      };
}
