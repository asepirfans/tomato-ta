import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:tomato_apps/routes/route_name.dart';
import 'package:fl_chart/fl_chart.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../../controllers/sensor_con.dart';
import '../../models/model.dart';
import '../../widgets/circle.dart';

class MonitoringDetailPagePlant2 extends StatelessWidget {
  final SensorController sensorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF86A789),
        flexibleSpace: SafeArea(
          child: Container(
            child: Center(
              child: Text(
                "Tanaman 2",
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
          onPressed: () => Get.offAllNamed(RouteName.monitoringPage),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder<List<Sensor>>(
        stream: sensorController.sensorStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Tidak ada data'),
            );
          }

          // final Sensor sensor = snapshot.data!.last;

          final List<Sensor> recentSensors = snapshot.data!.take(5).toList();

          List<Datum> recentData =
              recentSensors.expand((sensor) => sensor.data).toList();

          final newData =
              recentSensors.map((sensor) => sensor.data.last.plant2).toList();

          final newSensor = sensorController.sensorsH.first.data.plant2;

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: (Get.width - (2 * 20)) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Kelembapan",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomPaint(
                                    foregroundPainter: CircleChart(
                                        newData.last.kelembapanTanah, true),
                                    child: Container(
                                      width: 200,
                                      height: (200 - (2 * 20)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '${newData.last.kelembapanTanah.toDouble().toPrecision(0)}%',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 200,
                      width: (Get.width - (2 * 20)) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Suhu",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomPaint(
                                    foregroundPainter:
                                        CircleChart(newData.last.suhu, false),
                                    child: Container(
                                      width: 200,
                                      height: (200 - (2 * 20)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '${newData.last.suhu.toDouble().toPrecision(0)}\u00B0C',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: (Get.width - (2 * 20)) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          newData.last.kelembapanTanah >= 60
                              ? "Lembab"
                              : "Kering",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 60,
                      width: (Get.width - (2 * 20)) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          newData.last.suhu >= 30 ? "Panas" : "Dingin",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 150,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${newData.last.keterangan}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  newData.last.keterangan == "Pompa Nyala"
                                      ? 'images/on.png'
                                      : 'images/off.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 300,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 30, left: 15, top: 10),
                    child: Column(
                      children: [
                        Text(
                          "Grafik Kelembapan",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 220,
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(
                                show: true,
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          value.toInt().toString(),
                                          style: TextStyle(
                                            color: const Color(0xff7589a2),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 1,
                                    getTitlesWidget: (value, meta) {
                                      DateTime dateTime =
                                          recentData[value.toInt()]
                                              .waktu
                                              .toLocal();
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 7),
                                        child: Text(
                                          DateFormat('HH:mm:ss')
                                              .format(dateTime),
                                          style: TextStyle(
                                            color: const Color(0xff7589a2),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border: Border.all(
                                    color: Color.fromARGB(255, 55, 77, 59),
                                    width: 1),
                              ),
                              minX: 0,
                              maxX: 4,
                              minY: 0,
                              maxY: 100,
                              lineBarsData: [
                                LineChartBarData(
                                  spots: recentData
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                        return FlSpot(
                                          entry.key.toDouble(),
                                          entry.value.plant2.kelembapanTanah
                                              .toDouble()
                                              .toPrecision(0),
                                        );
                                      })
                                      .take(5)
                                      .toList(),
                                  isCurved: true,
                                  color: Color(0xFF86A789),
                                  belowBarData: BarAreaData(
                                    show: false,
                                    color: Color.fromARGB(255, 70, 145, 84),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Container(
                  height: 300,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 30, left: 15, top: 10),
                    child: Column(
                      children: [
                        Text(
                          "Grafik Suhu",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 220,
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(
                                show: true,
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          value.toInt().toString(),
                                          style: TextStyle(
                                            color: const Color(0xff7589a2),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 1,
                                    getTitlesWidget: (value, meta) {
                                      DateTime dateTime =
                                          recentData[value.toInt()]
                                              .waktu
                                              .toLocal();
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 7),
                                        child: Text(
                                          DateFormat('HH:mm:ss')
                                              .format(dateTime),
                                          style: TextStyle(
                                            color: const Color(0xff7589a2),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border: Border.all(
                                    color: Color.fromARGB(255, 55, 77, 59),
                                    width: 1),
                              ),
                              minX: 0,
                              maxX: 4,
                              minY: 0,
                              maxY: 50,
                              lineBarsData: [
                                LineChartBarData(
                                  spots: recentData
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                        return FlSpot(
                                          entry.key.toDouble(),
                                          entry.value.plant2.suhu
                                              .toDouble()
                                              .toPrecision(0),
                                        );
                                      })
                                      .take(5)
                                      .toList(),
                                  isCurved: true,
                                  gradient: LinearGradient(
                                    colors: [
                                      ColorTween(
                                              begin: Colors.amber,
                                              end: Colors.white)
                                          .lerp(0.2)!,
                                      ColorTween(
                                              begin: Colors.green,
                                              end: Colors.white)
                                          .lerp(0.2)!,
                                    ],
                                  ),
                                  isStrokeCapRound: true,
                                  color: Color(0xFF86A789),
                                  belowBarData: BarAreaData(
                                    show: false,
                                    color: Color.fromARGB(255, 70, 145, 84),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFF86A789),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Kelembapan Tanah Tertinggi: ${newSensor.highestSoil}%",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Suhu Tertinggi: ${newSensor.highestTemperature}°C",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          );
        },
      ),
    );
  }
}
