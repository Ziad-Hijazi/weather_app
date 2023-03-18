import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubits/weather_cubit/weater_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_Provider.dart';
import 'package:weather/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search A City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatherServises servises = WeatherServises();
                      WeatherModel? weather =
                          await servises.getWeather(cityName: cityName!);
                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<WeatherProvider>(context, listen: false)
                          .cityName = cityName;

                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search)),
                hintText: 'Enter a City',
                label: Text('Search'),
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 33, horizontal: 25)),
          ),
        ),
      ),
    );
  }
}
