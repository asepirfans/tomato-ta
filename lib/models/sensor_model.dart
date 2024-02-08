class Sensor {
  String id;
  num suhu;
  num kelembapan;
  num kelembapanTanah;
  String keterangan;
  DateTime waktu;
  num v;

  Sensor({
    required this.id,
    required this.suhu,
    required this.kelembapan,
    required this.kelembapanTanah,
    required this.keterangan,
    required this.waktu,
    required this.v,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      id: json["_id"] ?? "",
      suhu: json["suhu"] ?? 0,
      kelembapan: json["kelembapan"] ?? 0,
      kelembapanTanah: json["kelembapanTanah"] ?? 0,
      keterangan: json["keterangan"] ?? "",
      waktu: DateTime.tryParse(json["waktu"] ?? "") ?? DateTime.now(),
      v: json["__v"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "suhu": suhu,
        "kelembapan": kelembapan,
        "kelembapanTanah": kelembapanTanah,
        "keterangan": keterangan,
        "waktu": waktu.toIso8601String(),
        "__v": v,
      };
}
