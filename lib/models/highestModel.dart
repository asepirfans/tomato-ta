// To parse this JSON data, do
//
//     final sensorHighest = sensorHighestFromJson(jsonString);

import 'dart:convert';

SensorHighest sensorHighestFromJson(String str) => SensorHighest.fromJson(json.decode(str));

String sensorHighestToJson(SensorHighest data) => json.encode(data.toJson());

class SensorHighest {
    bool success;
    int statusCode;
    Data data;

    SensorHighest({
        required this.success,
        required this.statusCode,
        required this.data,
    });

    factory SensorHighest.fromJson(Map<String, dynamic> json) => SensorHighest(
        success: json["success"],
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "data": data.toJson(),
    };
}

class Data {
    plant plant1;
    plant plant2;
    plant plant3;

    Data({
        required this.plant1,
        required this.plant2,
        required this.plant3,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        plant1: plant.fromJson(json["plant1"]),
        plant2: plant.fromJson(json["plant2"]),
        plant3: plant.fromJson(json["plant3"]),
    );

    Map<String, dynamic> toJson() => {
        "plant1": plant1.toJson(),
        "plant2": plant2.toJson(),
        "plant3": plant3.toJson(),
    };
}

class plant {
    String highestTemperature;
    String highestSoil;

    plant({
        required this.highestTemperature,
        required this.highestSoil,
    });

    factory plant.fromJson(Map<String, dynamic> json) => plant(
        highestTemperature: json["highestTemperature"],
        highestSoil: json["highestSoil"],
    );

    Map<String, dynamic> toJson() => {
        "highestTemperature": highestTemperature,
        "highestSoil": highestSoil,
    };
}
