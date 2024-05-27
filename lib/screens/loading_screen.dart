// ignore_for_file: prefer_const_constructors

import 'package:clima/screens/error_screen.dart';
import 'package:clima/components/loading_indicator.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  Future<dynamic> getLocationData() async => await WeatherModel().getLocationWeather();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getLocationData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingIndicator();
          }
          if (snapshot.hasError) {
            return ErrorScreen(error: snapshot.error.toString());
          }
          return LocationScreen(locationWeather: snapshot.data);
        });
  }
}
