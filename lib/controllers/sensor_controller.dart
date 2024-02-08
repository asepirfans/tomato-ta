import 'dart:convert';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../providers/api.dart'; // Pastikan untuk mengimpor ApiController
import '../models/sensor_model.dart'; // Pastikan untuk mengimpor model Sensor

class SensorController extends GetxController {
  final ApiController apiController = ApiController();
  RxList<Sensor> sensors = <Sensor>[].obs;
  late IO.Socket socket;

  @override
  void onInit() {
    super.onInit();
    _initializeSocket();
    fetchData();
  }

  void _initializeSocket() {
    // Ganti URL dengan URL Socket.IO server Anda
    socket =
        IO.io('https://backend-ta.up.railway.app/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.on('connect', (_) {
      print('Socket connected');
    });

    socket.on('newSensorData', (data) {
      // Handle pembaruan sensor dari server
      print('Sensor Update: $data');
      final dynamic responseData = data;

      if (responseData is List) {
        // Jika respons berisi kumpulan data sensor (array)
        final List<Sensor> updatedSensors =
            responseData.map((data) => Sensor.fromJson(data)).toList();

        // Hapus data yang lebih lama dari sensors dan tambahkan yang baru
        sensors.removeWhere((oldSensor) => updatedSensors
            .any((newSensor) => newSensor.waktu == oldSensor.waktu));
        sensors.addAll(updatedSensors);

        // Simpan hanya 5 data terbaru
        if (sensors.length > 5) {
          sensors.removeRange(0, sensors.length - 5);
        }
      } else if (responseData is Map<String, dynamic>) {
        // Jika respons hanya berisi satu data sensor
        final Sensor singleSensor = Sensor.fromJson(responseData);

        // Hapus data yang lebih lama dari sensors dan tambahkan yang baru
        sensors
            .removeWhere((oldSensor) => oldSensor.waktu == singleSensor.waktu);
        sensors.add(singleSensor);

        // Simpan hanya 5 data terbaru
        if (sensors.length > 5) {
          sensors.removeRange(0, sensors.length - 5);
        }
      } else {
        print('Invalid sensor update type: ${responseData.runtimeType}');
      }
    });

    socket.on('disconnect', (reason) {
      print('Socket disconnected. Reason: $reason');
    });
  }

  Future<void> fetchData() async {
    try {
      final response = await apiController.fetchData();

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);

        print('Response Data Type: ${responseData.runtimeType}');

        if (responseData is List) {
          // Jika respons berisi kumpulan data sensor (array)
          sensors.assignAll(
            responseData.map((data) => Sensor.fromJson(data)).toList(),
          );
        } else if (responseData is Map<String, dynamic>) {
          // Jika respons hanya berisi satu data sensor
          final Sensor singleSensor = Sensor.fromJson(responseData);
          sensors.assignAll([singleSensor]);
        } else {
          print('Invalid sensor update type: ${responseData.runtimeType}');
        }
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
    socket.disconnect();
    super.onClose();
  }
}
