import 'package:weather/models/weather_model.dart';

abstract class WeatherState {}

class Weatherinitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  WeatherModel weatherModel;
  WeatherSuccess({required this.weatherModel});
}

class WeatherFailure extends WeatherState {}
