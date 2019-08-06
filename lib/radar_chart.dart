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

  var ticksTextStyle = TextStyle(color: Colors.grey, fontSize: 12);

  RadarChartPainter(this.ticks);

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2.0;
    var centerY = size.height / 2.0;
    var radius = centerX * 0.8;

    var tickDistance = radius / (ticks.length + 1);

    ticks.asMap().forEach((index, tick) {
      var tickRadius = tickDistance * (index + 1);

      canvas.drawCircle(Offset(centerX, centerY), tickRadius, ticksPaint);

      TextPainter(
        text: TextSpan(text: tick.toString(), style: ticksTextStyle),
        textDirection: TextDirection.ltr,
      )
        ..layout(minWidth: 0, maxWidth: size.width)
        ..paint(canvas, Offset(centerX, centerY + tickRadius));
    });

    canvas.drawCircle(Offset(centerX, centerY), radius, polarPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
