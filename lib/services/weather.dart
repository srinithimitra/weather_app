import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/log.dart';

const apiKey = 'your api key goes here';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
double latitude = 0;
double longitude = 0;

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Network network = Network('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var data = await network.getData();
    logger.i("City Weather Data: $data");
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    Network network = Network('$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var data = await network.getData();
    logger.i("Location Weather Data: $data");
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩️';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '⛄';
    } else if (condition < 800) {
      return '🌌';
    } else if (condition == 800) {
      return '🌞';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍♀️';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍨 time ';
    } else if (temp > 20) {
      return 'time for shorts and 👕';
    } else if (temp < 10) {
      return 'you will need 🧣 and 🧤 ';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
