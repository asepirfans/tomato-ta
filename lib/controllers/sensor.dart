import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import '../providers/api.dart';
import '../models/sensor_model.dart';

class SensorController extends GetxController {
  final ApiController apiController = ApiController();
  RxList<Sensor> sensors = <Sensor>[].obs;

  final _sensorStreamController = StreamController<List<Sensor>>.broadcast();
  Stream<List<Sensor>> get sensorStream => _sensorStreamController.stream;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(Duration(seconds: 1), (timer) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    try {
      final response = await apiController.fetchData();

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);

        print('Response Data Type: ${responseData.runtimeType}');

        if (responseData is List) {
          sensors.assignAll(
            responseData.map((data) => Sensor.fromJson(data)).toList(),
          );
        } else if (responseData is Map<String, dynamic>) {
          final Sensor singleSensor = Sensor.fromJson(responseData);
          sensors.assignAll([singleSensor]);
        } else {
          print('Invalid sensor update type: ${responseData.runtimeType}');
        }

        _sensorStreamController
            .add(sensors.toList()); // Tambahkan data awal ke stream
      } else {
        throw Exception(
          'Gagal mengambil data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error fetchData: $e');
    }
  }

  @override
  void onClose() {
    _sensorStreamController.close(); // Tutup stream controller
    super.onClose();
  }
}
