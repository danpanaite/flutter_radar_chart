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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkMode = false;

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
      body: Container(
        color: darkMode ? Colors.black : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                darkMode
                    ? Text(
                        'Light mode',
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        'Dark mode',
                        style: TextStyle(color: Colors.black),
                      ),
                Switch(
                  value: this.darkMode,
                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: darkMode
                  ? RadarChart.dark(
                      ticks: ticks,
                      features: features,
                      data: data,
                      reverseAxis: true,
                    )
                  : RadarChart.light(
                      ticks: ticks,
                      features: features,
                      data: data,
                      reverseAxis: true,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
