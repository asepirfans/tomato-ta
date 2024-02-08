import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import '../providers/api.dart';

class PumpController extends GetxController {
  final ApiController apiProvider = ApiController();
  RxMap<String, String> pumpStatus = {
    'pump1': 'OFF',
    'pump2': 'OFF',
    'pump3': 'OFF',
  }.obs;

  String togglePumpStatus(String pump) {
    return pumpStatus[pump] == 'ON' ? 'OFF' : 'ON';
  }

  String getPumpStatus(String pump) {
    return pumpStatus[pump] ?? 'OFF';
  }
  

  Future<void> sendPumpCommand(String pump) async {
    try {
      // Toggle status pompa di controller
      pumpStatus[pump] = togglePumpStatus(pump);

      // Kirim data ke server
      final Map<String, dynamic> pumpData = {
        'pump1': pumpStatus['pump1'],
        'pump2': pumpStatus['pump2'],
        'pump3': pumpStatus['pump3'],
      };

      final http.Response response = await apiProvider.postData(pumpData);
      final Map<String, dynamic> responseBody = json.decode(response.body);

      // Perbarui status pompa di controller berdasarkan respons dari server
      if (responseBody.containsKey('pump1')) {
        pumpStatus['pump1'] = responseBody['pump1'];
      }

      if (responseBody.containsKey('pump2')) {
        pumpStatus['pump2'] = responseBody['pump2'];
      }

      if (responseBody.containsKey('pump3')) {
        pumpStatus['pump3'] = responseBody['pump3'];
      }
    } catch (e) {
      // Handle error
      print('Error sendPumpCommand: $e');
    }
  }
}
