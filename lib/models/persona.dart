import 'dart:convert';



Persona personaFromJson(String str) => Persona.fromJson(json.decode(str));

String personaToJson(Persona data) => json.encode(data.toJson());



class Persona {
  Persona({
    this.id,
    this.nombre,
    this.apellidos,
    this.direccion,
    this.celular,
    this.genero,
    this.fechaNacimiento,
    this.usuario,
    
    

  });

  String id;
  String nombre;
  String apellidos;
  String direccion;
  String genero;
  String celular;
  String fechaNacimiento;
  String usuario;
  
  
  
  

  factory Persona.fromJson(Map<String, dynamic> json) => Persona(
        id: json["_id"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        direccion: json["direccion"] ?? 'Sin Direccion',
        celular: json["celular"],
        genero: json["genero"] ?? '',
        fechaNacimiento: json["fecha_nacimiento"] ?? '',
        usuario: json["usuario"],
      
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "apellidos": apellidos,
        "direccion": direccion,
        "celular": celular,
        "genero": genero, 
        "fecha_nacimiento": fechaNacimiento,
        "usuario": usuario,
      };
}
