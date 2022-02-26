

// To parse this JSON data, do
//
//     final scanModel = scanModelFromMap(jsonString);

import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

class ScanModel {
    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
    })
    {
      if (this.valor.contains('http')){
        this.tipo ='http';
        print('se guardo en http');
      }else{
        this.tipo='geo';
      }
    }

    int? id;
    String? tipo;
    String valor;


    LatLng gettLatLng(){
      final latLng=this.valor.substring(4).split(',');
      final lat=double.parse(latLng[0]);
      final long=double.parse(latLng[1]);

      return LatLng(lat, long);
    }

    factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
