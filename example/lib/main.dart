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
    const ticks = [10, 20, 30];
    const features = ["AA", "BB", "CC", "DD", "EE", "FF", "GG", "HH"];

    return Scaffold(
      appBar: AppBar(
        title: Text('Radar Chart Example'),
      ),
      body: Center(
        child: RadarChart(
          ticks: ticks,
          features: features,
        ),
      ),
    );
  }
}
