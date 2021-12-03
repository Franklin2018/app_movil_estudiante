
import 'dart:convert';


Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());


class Usuario {
  Usuario({
    this.id,
    this.correo,
    this.contrasena,
    this.img_perfil,
    this.estado,
    this.rol = "USER_ROLE",
  });

  String id;
  String correo;
  String contrasena;
  String img_perfil;
  String estado;
  String rol;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        correo: json["correo"],
        contrasena: json["contrasena"],
        img_perfil: json["img_perfil"],
        estado: json["estado"],
        rol: json["rol"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "correo": correo,
        "contrasena": contrasena,
        "img_perfil": img_perfil,
        "estado": estado,
        "rol": rol,
      };


}
