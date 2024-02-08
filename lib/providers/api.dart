import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiController {
  static const String URL_API = "https://8z585jxl-5000.asse.devtunnels.ms";

  Future<http.Response> fetchData() async {
    try {
      final response = await http.get(Uri.parse('$URL_API/api/sensors'));
      print('Status Code: ${response.statusCode}');
      // print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during fetchData: $e');
      throw e;
    }
  }

  Future<http.Response> fetchHighestData() async {
    try {
      final response = await http.get(Uri.parse('$URL_API/api/highestSensor'));
      print('Status Code: ${response.statusCode}');
      // print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during fetchData: $e');
      throw e;
    }
  }

   Future<http.Response> postData(Map<String, dynamic> data)async {
    try {
      final response = await http.post(
        Uri.parse('$URL_API/api/pump'), // Ganti URL dengan URL POST yang sesuai
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      return response;
    } catch (e) {
      throw e;
    }
  }
   Future<http.Response> getData() async {
    try {
      final response = await http.get(Uri.parse('$URL_API/api/pump'));
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during fetchData: $e');
      throw e;
    }
  }
}
