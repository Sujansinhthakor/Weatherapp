import 'package:flutter/material.dart';
import 'package:Weatherapp/screens/loading_screen.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
