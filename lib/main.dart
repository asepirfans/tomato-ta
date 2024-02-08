import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './pages/homePage.dart';
import './routes/page_route.dart';
import './controllers/sensor_con.dart';
import './controllers/pump_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SensorController());
  Get.put(PumpController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      getPages: AppPage.pages,
    );
  }
}
