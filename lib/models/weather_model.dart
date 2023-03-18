import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String condition;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data['current']['last_updated']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        condition: jsonData['condition']['text']);
  }
  @override
  String toString() {
    return 'temp=$temp,date=$date,maxtemp=$maxTemp,mintemp=$minTemp';
  }

  String getImage() {
    if (condition == 'Clear')
      return 'assets/images/clear.png';
    else if (condition == 'Cloudy')
      return 'assets/images/cloudy.png';
    else if (condition == 'Moderate rain')
      return 'assets/images/rainy.png';
    else if (condition == 'Snow')
      return 'assets/images/snow.png';
    else if (condition == 'Thunderstorm')
      return 'assets/images/thunderstorm.png';
    else
      return 'assets/images/clear.png';
  }

  MaterialColor getTheme() {
    if (condition == 'Clear')
      return Colors.orange;
    else if (condition == 'Cloudy')
      return Colors.green;
    else if (condition == 'Moderate rain')
      return Colors.red;
    else if (condition == 'Snow')
      return Colors.deepOrange;
    else if (condition == 'Thunderstorm')
      return Colors.purple;
    else
      return Colors.blue;
  }
}
