import 'package:Weatherapp/services/location.dart';
import 'package:Weatherapp/services/networking.dart';
const apikey = '05dba4429fbc452413ab83aeff6ff7a2';
class WeatherModel {

  Future GetCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric');
    var weatherdata=await networkHelper.getData();
    print(weatherdata);
    return weatherdata;
  }

  Future getLocationWeather()async{
    Location location = Location();
    await location.getCurrentlocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherdata = await networkHelper.getData();
    //since weatherdata is dynamic our return type will be also dynamic
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
