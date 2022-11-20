import 'package:flutter/material.dart';
import 'package:noob_weather/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWeather() async {
    Weather instance = Weather(location: 'Rajshahi');
    await instance.getData();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'temperature': instance.temperature,
      'temperatureMin': instance.temperatureMin,
      'temperatureMax': instance.temperatureMax,
      'condition': instance.condition,
      'time': instance.time,
      'isDay': instance.isDay
    });
  }

  @override
  void initState() {
    super.initState();
    setupWeather();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: SpinKitFadingCube(
        color: Colors.deepPurple,
        size: 70.0,
      ),
    ));
  }
}
