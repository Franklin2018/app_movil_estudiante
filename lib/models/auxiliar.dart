import 'dart:convert';



// To parse this JSON data, do
//
//     final medico = medicoFromJson(jsonString);

Auxiliar medicoFromJson(String str) => Auxiliar.fromJson(json.decode(str));

String medicoToJson(Auxiliar data) => json.encode(data.toJson());

class Auxiliar {
  Auxiliar({
    // this.ok,
    this.id,
    this.calificacion,
    this.especialidad,
    this.descripcion,
    // this.persona,
  });

  // bool ok;
  String id;
  int calificacion;
  String especialidad;
  String descripcion;
  // Persona persona;

  factory Auxiliar.fromJson(Map<String, dynamic> json) => Auxiliar(
        // ok: json["ok"],
        id: json["_id"],
        calificacion: json["calificacion"],
        especialidad: json["especialidad"],
        descripcion: json["descripcion"],
        // persona: Persona.fromJson(json["persona"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "calificacion": calificacion,
        "especialidad": especialidad,
        "descripcion": descripcion,
        // "persona": persona.toJson(),
      };
}

// class Persona {
//     Persona({
//         this.id,
//         this.nombre,
//         this.apellido,
//     });

//     String id;
//     String nombre;
//     String apellido;

//     factory Persona.fromJson(Map<String, dynamic> json) => Persona(
//         id: json["_id"],
//         nombre: json["nombre"],
//         apellido: json["apellido"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "nombre": nombre,
//         "apellido": apellido,
//     };
// }
