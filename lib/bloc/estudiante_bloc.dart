import 'dart:async';

import 'package:app_movil_estudiante/models/persona.dart';
import 'package:app_movil_estudiante/models/usuario.dart';
import 'package:app_movil_estudiante/models/estudiante.dart';

import 'package:app_movil_estudiante/services/estudiante_service.dart';

class EstudianteBloc {
  String estudiante;
  final _estudianteService = EstudianteService();

  String get getEstudiante => estudiante;
  
  Future registrarEstudiante(
    Usuario usuario,
    Persona persona,
    Estudiante estudiante,
  ) async {
    await _estudianteService.registrarFinal(usuario, persona, estudiante).then((value) {
      print("PRINT ESTUDIANTE BLOC");
      print(value['ok']);
      print(value);
      if (value['ok']) {
        print(value);
      }
    });
  }
}
