// To parse this JSON data, do
//
//     final listaMedico = listaMedicoFromJson(jsonString);

import 'dart:convert';

import 'package:app_movil_estudiante/models/auxiliar.dart';
import 'package:app_movil_estudiante/models/persona.dart';
import 'package:app_movil_estudiante/models/usuario.dart';

AuxiliarResponse medicoResponseFromJson(String str) => AuxiliarResponse.fromJson(json.decode(str));

String auxiliarResponseToJson(AuxiliarResponse data) => json.encode(data.toJson());

class AuxiliarResponse {
    AuxiliarResponse({
        this.usuario,
        this.persona,
        this.auxiliar,
    });

    Usuario usuario;
    Persona persona;
    Auxiliar auxiliar;

    factory AuxiliarResponse.fromJson(Map<String, dynamic> json) => AuxiliarResponse(
        usuario: Usuario.fromJson(json["usuario"]),
        persona: Persona.fromJson(json["persona"]),
        auxiliar: Auxiliar.fromJson(json["auxiliar"]),
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario.toJson(),
        "persona": persona.toJson(),
        "auxiliar": auxiliar.toJson(),
    };
}
