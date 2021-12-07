import 'dart:convert';

import 'package:app_movil_estudiante/models/listaauxiliar.dart';

// To parse this JSON data, do
//
//     final listaMedicos = listaMedicosFromJson(jsonString);

// To parse this JSON data, do
//
//     final listaMedicos = listaMedicosFromJson(jsonString);

ListaAuxiliares listaAuxiliaresFromJson(String str) =>
    ListaAuxiliares.fromJson(json.decode(str));

String listaAuxilaresToJson(ListaAuxiliares data) => json.encode(data.toJson());

class ListaAuxiliares {
    ListaAuxiliares({
    this.ok,
    this.listaauxiliares,
  });

  bool ok;
  List<AuxiliarResponse> listaauxiliares;

  factory ListaAuxiliares.fromJson(Map<String, dynamic> json) => ListaAuxiliares(
        ok: json["ok"],
        listaauxiliares: List<AuxiliarResponse>.from(
            json["listaauxiliares"].map((x) => AuxiliarResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "listaauxiliares": List<dynamic>.from(listaauxiliares.map((x) => x.toJson())),
      };
}
