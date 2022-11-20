import 'package:flutter/material.dart';
import 'package:noob_weather/pages/home.dart';
import 'package:noob_weather/pages/select_location.dart';
import 'package:noob_weather/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const home(),
      '/location': (context) => const SelectLocation()
    },
  ));
}
