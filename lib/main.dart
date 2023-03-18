import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:weather/cubits/weather_cubit/weater_cubit.dart';
import 'package:weather/services/weather_services.dart';
import 'pages/home_Page.dart';
import 'package:weather/providers/weather_Provider.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => WeatherCubit(WeatherServises()),
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel ==
                null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context).weatherModel!.getTheme(),
      ),
      home: HomePage(),
    );
  }
}
