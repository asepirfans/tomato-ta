// To parse this JSON data, do
//
//     final sensor = sensorFromJson(jsonString);

import 'dart:convert';

Sensor sensorFromJson(String str) => Sensor.fromJson(json.decode(str));

String sensorToJson(Sensor data) => json.encode(data.toJson());

class Sensor {
  bool success;
  int statusCode;
  List<Datum> data;

  Sensor({
    required this.success,
    required this.statusCode,
    required this.data,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        success: json["success"],
        statusCode: json["statusCode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  Plant plant1;
  Plant plant2;
  Plant plant3;
  DateTime waktu;
  int v;

  Datum({
    required this.id,
    required this.plant1,
    required this.plant2,
    required this.plant3,
    required this.waktu,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        plant1: Plant.fromJson(json["plant1"]),
        plant2: Plant.fromJson(json["plant2"]),
        plant3: Plant.fromJson(json["plant3"]),
        waktu: DateTime.parse(json["waktu"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "plant1": plant1.toJson(),
        "plant2": plant2.toJson(),
        "plant3": plant3.toJson(),
        "waktu": waktu.toIso8601String(),
        "__v": v,
      };
}

class Plant {
  num suhu;
  num kelembapan;
  num kelembapanTanah;
  String id;
  String? keterangan;

  Plant({
    required this.suhu,
    required this.kelembapan,
    required this.kelembapanTanah,
    required this.id,
    this.keterangan,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        suhu: json["suhu"],
        kelembapan: json["kelembapan"],
        kelembapanTanah: json["kelembapanTanah"],
        id: json["_id"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "suhu": suhu,
        "kelembapan": kelembapan,
        "kelembapanTanah": kelembapanTanah,
        "_id": id,
        "keterangan": keterangan,
      };
}


