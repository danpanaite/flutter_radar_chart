library radar_chart;

import 'package:flutter/material.dart';

class RadarChart extends StatelessWidget {
  final List<int> ticks;

  const RadarChart({
    Key key,
    @required this.ticks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, double.infinity),
      painter: RadarChartPainter(ticks),
    );
  }
}

class RadarChartPainter extends CustomPainter {
  final List<int> ticks;

  var polarPaint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0
    ..isAntiAlias = true;

  var ticksPaint = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0
    ..isAntiAlias = true;

  RadarChartPainter(this.ticks);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2.0;
    double centerY = size.height / 2.0;
    double radius = centerX * 0.8;

    double tickRadius = radius / (ticks.length + 1);

    ticks.asMap().forEach((index, tick) => canvas.drawCircle(
        Offset(centerX, centerY), tickRadius * (index + 1), ticksPaint));

    canvas.drawCircle(Offset(centerX, centerY), radius, polarPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
