import 'package:flutter/material.dart';
import 'package:radar_chart/radar_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radar Chart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const ticks = [7, 14, 21, 28, 35];
    const features = ["AA", "BB", "CC", "DD", "EE", "FF", "GG", "HH"];
    const data = [
      [10, 20, 28, 5, 16, 15, 17, 6],
      [15, 1, 4, 14, 23, 10, 6, 19]
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Radar Chart Example'),
      ),
      body: Center(
        child: RadarChart.light(
          ticks: ticks,
          features: features,
          data: data,
        ),
      ),
    );
  }
}
