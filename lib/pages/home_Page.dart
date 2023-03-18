import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubits/weather_cubit/weater_cubit.dart';
import 'package:weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search_Page.dart';
import 'package:weather/providers/weather_Provider.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            return SuccessBodt(weatherData: state.weatherModel);
          } else if (state is WeatherFailure) {
            return Center(
              child: Text('Something went Wrong , please try again'),
            );
          } else {
            return defultBody();
          }
        },
      ),
    );
  }
}

class defultBody extends StatelessWidget {
  const defultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: Text(
          'There is no weather 🥱 Start \n searching now 🔍',
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }
}

class SuccessBodt extends StatelessWidget {
  const SuccessBodt({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        weatherData!.getTheme(),
        weatherData!.getTheme()[300]!,
        weatherData!.getTheme()[100]!
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(flex: 3),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Updated at: ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                '${weatherData!.temp.toInt()}',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Column(
                children: [
                  Text(
                    'maxTemp:${weatherData!.maxTemp.toInt()}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'minTemp:${weatherData!.minTemp.toInt()}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            weatherData!.condition,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(
            flex: 4,
          )
        ],
      ),
    );
  }
}
