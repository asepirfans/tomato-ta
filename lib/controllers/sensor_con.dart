import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import '../providers/api.dart';
import '../models/model.dart';
import '../models/highestModel.dart';

class SensorController extends GetxController {
  final ApiController apiController = ApiController();
  RxList<Sensor> sensors = <Sensor>[].obs;
  RxList<SensorHighest> sensorsH = <SensorHighest>[].obs;

  final _sensorStreamController = StreamController<List<Sensor>>.broadcast();
  Stream<List<Sensor>> get sensorStream => _sensorStreamController.stream;

  @override
  void onInit() {
    super.onInit();
    fetchHighestData();
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

        _sensorStreamController.add(sensors.toList());
      } else {
        throw Exception(
          'Gagal mengambil data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error fetchData: $e');
    }
  }

  Future<void> fetchHighestData() async {
    try {
      final response = await apiController.fetchHighestData();

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('data')) {
          final dynamic data = responseData['data'];

          if (data is Map<String, dynamic>) {
            final SensorHighest sensorHighest = SensorHighest(
              success: responseData['success'],
              statusCode: responseData['statusCode'],
              data: Data(
                plant1: plant.fromJson(data['plant1']),
                plant2: plant.fromJson(data['plant2']),
                plant3: plant.fromJson(data['plant3']),
              ),
            );

            sensorsH.assignAll([sensorHighest]);
          } else {
            print('Invalid sensor update type for data: ${data.runtimeType}');
          }
        } else {
          print('Invalid sensor update type or missing key "data"');
        }
      } else {
        throw Exception(
          'Gagal mengambil data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error fetchHighestData: $e');
    }
  }

  @override
  void onClose() {
    _sensorStreamController.close(); // Tutup stream controller
    super.onClose();
  }
}
