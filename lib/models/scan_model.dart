import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScannModel scannModelFromJson(String str) => ScannModel.fromJson(json.decode(str));
String scannModelToJson(ScannModel data) => json.encode(data.toJson());

class ScannModel {
  ScannModel({this.id, this.tipo, required this.valor});

  int? id;
  String? tipo;
  ScannValueModel valor;

  LatLng getLatLng() {
    return LatLng(valor.geo[0], valor.geo[1]);
  }

  factory ScannModel.fromJson(Map<String, dynamic> json) => ScannModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: ScannValueModel.fromJson(jsonDecode(json["valor"])),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": jsonEncode(valor.toJson()),
      };
}

ScannValueModel scannValueModelFromJson(String str) => ScannValueModel.fromJson(json.decode(str));
String scannValueModelToJson(ScannValueModel data) => json.encode(data.toJson());

class ScannValueModel {
  ScannValueModel({
    this.geo = const [1.1, -2.2],
    this.title = '',
    this.description = '',
  });

  List<double> geo;
  String title;
  String description;

  factory ScannValueModel.fromJson(Map<String, dynamic> json) => ScannValueModel(
        geo: List<double>.from(json["geo"].map((x) => x.toDouble())),
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "geo": List<dynamic>.from(geo.map((x) => x)),
        "title": title,
        "description": description,
      };
}
