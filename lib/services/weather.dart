import '../services/location.dart';
import '../services/networking.dart';
import 'networking.dart';

const String kApiKey = 'c48b2556ae0269360842fcd2b44ce709';
const String kOpenWeatherMapCurrentWeatherAPIUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future getWeatherDataBasedOnCityName(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper('$kOpenWeatherMapCurrentWeatherAPIUrl?q=$cityName&appid=$kApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getLocationAndWeatherDataAgainstThatLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper('$kOpenWeatherMapCurrentWeatherAPIUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
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
      return 'Time for 🩳 and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
