import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherServises weatherServises;
  String? cityName;
  WeatherModel? weatherModel;
  WeatherCubit(this.weatherServises) : super(Weatherinitial());

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());

    dynamic weatherModel = await weatherServises.getWeather(cityName: cityName);
    emit(WeatherSuccess(weatherModel: weatherModel));
    emit(WeatherFailure());
  }
}
