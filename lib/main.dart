import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(
       const Center(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: MyWidget()),
      )
  );
}


class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return FutureBuilder<String>(
        future: getData(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Text(
              "Temperature: ${snapshot.data}°C",
              style: const TextStyle(
                fontFamily: "Roboto",
                fontSize: 30.0,
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        }
    );
  }
}

Future<String> getData() async{
  String url = 'https://api.openweathermap.org/data/2.5/onecall?lat=24.3745&lon=88.6042&units=metric&exclude=minutely,daily,alerts,hourly&appid=d12df384e504558e0a7db7841f96679b';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    return json['current']['temp'].toString();
  } else {
    throw Exception('Failed to load Data');
  }
}
