import 'dart:convert';



Estudiante estudianteFromJson(String str) => Estudiante.fromJson(json.decode(str));

String estudianteToJson(Estudiante data) => json.encode(data.toJson());


 
class Estudiante {
  Estudiante({
    this.id,
    this.carrera,  
    this.persona, 
    
    

  });

  String id;
  String carrera;
  String persona;
  
  
  
  

  factory Estudiante.fromJson(Map<String, dynamic> json) => Estudiante(
        id: json["_id"],
        carrera: json["carrera"],
        persona: json["persona"],
      
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "carrera": carrera,
        "persona": persona,
      };
}
