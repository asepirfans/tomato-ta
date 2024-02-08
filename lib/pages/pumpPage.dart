import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pump_controller.dart';
import '../routes/route_name.dart';

class PumpPage extends StatelessWidget {
  final PumpController pumpController = Get.find();

  Widget buildPumpSwitch(String pump, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Switch(
            value: pumpController.getPumpStatus(pump) == 'ON',
            onChanged: (bool value) {
              pumpController.sendPumpCommand(pump);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF86A789),
        flexibleSpace: SafeArea(
          child: Container(
            child: Center(
              child: Text(
                "Kontrol",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        leading: IconButton(
           onPressed: () => Get.offAllNamed(RouteName.homePage),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Obx(() => buildPumpSwitch('pump1', 'Pump 1')),
          SizedBox(height: 8),
          Obx(() => buildPumpSwitch('pump2', 'Pump 2')),
          SizedBox(height: 8),
          Obx(() => buildPumpSwitch('pump3', 'Pump 3')),
        ],
      ),
    );
  }
}
