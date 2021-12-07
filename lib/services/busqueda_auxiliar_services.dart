import 'dart:convert';
import 'package:app_movil_estudiante/global/environment.dart';
import 'package:app_movil_estudiante/models/busqueda_auxiliar.dart';
import 'package:app_movil_estudiante/models/listaauxiliar.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class BusquedaAuxliarService with ChangeNotifier {
  //final _storage = new FlutterSecureStorage();
  List<AuxiliarResponse> listaauxiliares;

  Future<List<AuxiliarResponse>> buscarAuxiliares(String fullname) async {
    //    final token = await this._storage.read(key: 'token');

   
    final data = {"nombre": fullname};

    final resp = await http.post(
        '${Environment.apiUrl}/medicos/getmedicobynombre',
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200) {
      final response = listaAuxiliaresFromJson(resp.body);
      this.listaauxiliares = response.listaauxiliares;

      return this.listaauxiliares;
    } else {
      this.listaauxiliares = [];
      return this.listaauxiliares;
    }
  }

  getEspecialidades() async {
    //   final token = await this._storage.read(key: 'token');

    final resp =
        await http.get('${Environment.apiUrl}/especialidad/getespecialidades');

    //print(resp.body);
  }
}
