library radar_chart;

import 'package:flutter/material.dart';
import 'dart:math' show pi, cos, sin;

class RadarChart extends StatelessWidget {
  final List<int> ticks;
  final List<String> features;

  const RadarChart({
    Key key,
    @required this.ticks,
    @required this.features,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, double.infinity),
      painter: RadarChartPainter(ticks, features),
    );
  }
}

class RadarChartPainter extends CustomPainter {
  final List<int> ticks;
  final List<String> features;

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

  var ticksTextStyle = TextStyle(color: Colors.grey, fontSize: 12);

  RadarChartPainter(this.ticks, this.features);

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2.0;
    var centerY = size.height / 2.0;
    var centerOffset = Offset(centerX, centerY);
    var radius = centerX * 0.8;

    // Painting the chart outline
    canvas.drawCircle(centerOffset, radius, polarPaint);

    // Painting the circles and labels for the given ticks (could be auto-generated)
    var tickDistance = radius / (ticks.length + 1);

    ticks.asMap().forEach((index, tick) {
      var tickRadius = tickDistance * (index + 1);

      canvas.drawCircle(centerOffset, tickRadius, ticksPaint);

      TextPainter(
        text: TextSpan(text: tick.toString(), style: ticksTextStyle),
        textDirection: TextDirection.ltr,
      )
        ..layout(minWidth: 0, maxWidth: size.width)
        ..paint(canvas, Offset(centerX, centerY - tickRadius - 12));
    });

    // Painting the axis for each given feature
    var angle = (2 * pi) / features.length;

    features.asMap().forEach((index, feature) {
      var featureOffset = Offset(centerX + radius * cos(angle * index - pi / 2),
          centerY + radius * sin(angle * index - pi / 2));

      canvas.drawLine(centerOffset, featureOffset, ticksPaint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
