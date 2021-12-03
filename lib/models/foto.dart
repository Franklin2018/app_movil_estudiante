import 'dart:convert';
import 'package:image_picker/image_picker.dart';

Foto fotoFromJson(String str) => Foto.fromJson(json.decode(str));

String fotoToJson(Foto data) => json.encode(data.toJson());

class Foto {
  Foto({
    this.value,
  });

  PickedFile value;

  factory Foto.fromJson(Map<String, dynamic> json) => Foto(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}
