import 'dart:convert';

import 'package:app_movil_estudiante/models/estudiante.dart';
import 'package:app_movil_estudiante/models/login_response.dart';
import 'package:app_movil_estudiante/models/persona.dart';
import 'package:app_movil_estudiante/models/usuario.dart';

import 'package:app_movil_estudiante/global/environment.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EstudianteService with ChangeNotifier{
  Usuario usuario;
  Persona persona;
  Estudiante estudiante;
  final _storage = new FlutterSecureStorage();
  bool _autenticando = false;

    bool get autenticando => this._autenticando;
  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }


  Future<bool> login(String email, String password) async {
    this.autenticando = true;

    final data = {'correo': email, 'contrasena': password};

    final resp = await http.post('${Environment.apiUrl}/login',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    this.autenticando = false;

    if (resp.statusCode == 200) {
    final loginResponse = loginResponseFromJson(resp.body);
     
       this.usuario = loginResponse.usuario;
       
       this.persona = loginResponse.persona;
      
      await this._guardarToken(loginResponse.token);

      return true;
    } else {
      return false;
    }
  }

 


 Future logout() async {
    await _storage.delete(key: 'token');
  }





  Future<dynamic> registrarFinal(Usuario usuario, Persona persona, Estudiante estudiante) async {

  final data={
    "correo":usuario.correo,
    "contrasena":usuario.contrasena,
    "rol":"USER_ROLE",
    'img_perfil': usuario.img_perfil,
    "nombre":persona.nombre,
    "apellidos":persona.apellidos,
    "celular":persona.celular,
    "direccion":persona.direccion,
    "fechaNacimiento":persona.fechaNacimiento,
    "genero":persona.genero,
    "carrera":estudiante.carrera
  };

   
    final res = await http.post('${Environment.apiUrl}/register',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {
      final respData = json.decode(res.body);
      return {'ok': respData['ok']};
    } else {
      final respData = json.decode(res.body);
      return {'ok': respData['ok']};
    }

  }






  Future validarEmail(String email) async {
    final res =
        await http.get('${Environment.apiUrl}/usuarios/keyunica?email=$email');

    if (res.statusCode == 200) {
      final respData = json.decode(res.body);
      var esValida = respData['ok'];
      return esValida;
    } else {
      final respData = json.decode(res.body);
      var esValida = respData['ok'];
      return esValida;
    }
  }






  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }


}

// validar gmail existente

// trabajar con la imagen en firebase
