import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherServises {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'a3ff37f6ab024976862143420230602';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try {
      Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      var jsonData = data['forecast']['forecastday'][0]['day'];
      WeatherModel weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weatherData;
  }
}
