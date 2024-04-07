import 'package:flutter/material.dart';
import '../services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:Weatherapp/services/weather.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getlocationData();
  }

  void getlocationData()async{
    WeatherModel weatherModel=WeatherModel();
    var weatherdata=await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherdata);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
