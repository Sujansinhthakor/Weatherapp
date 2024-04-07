import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:Weatherapp/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temperature;
  int? condition;
  String? cityname;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherdata) {
    if (weatherdata == null) {
      temperature = 0;
      cityname = 'unable to get the weather data';
      return;
    }
    setState(() {
      double temp = weatherdata['main']['temp'];
      temperature = temp.toInt();
      condition = weatherdata['weather'][0]['id'];
      cityname = weatherdata['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    WeatherModel weather = WeatherModel();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.9), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherdata = await weather.getLocationWeather();
                      updateUI(weatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      var typeName=await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              return CityScreen();
                            }
                        ),
                      );
                      if(typeName!=null){
                        var weatherdata=await weather.GetCityWeather(typeName);
                        updateUI(weatherdata);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '${weather.getWeatherIcon(condition!)}',
                      style: kMessageTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '${weather.getMessage(temperature!)} in $cityname',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
