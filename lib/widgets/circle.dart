import 'dart:math';

import 'package:flutter/material.dart';

class CircleChart extends CustomPainter {
  num value;
  bool isHum;

  CircleChart(this.value, this.isHum);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    int maximumValue =
        isHum ? 100 : 60; // Temp's max is 50, Humidity's max is 100

    Paint outerCircle = Paint()
      ..strokeWidth = 10
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Paint hum = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = (value == maximumValue || value > maximumValue)
          ? Colors.green
          : Colors.blue;

    Paint temp = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = (value == maximumValue) ? Colors.green : Colors.red;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;
    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (value / maximumValue);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, isHum ? hum : temp);
  }
}
