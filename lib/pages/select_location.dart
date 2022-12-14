import 'package:flutter/material.dart';
import 'package:noob_weather/services/weather.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  late List<Weather> locations;
  void loadLocations() {
    locations = [
      Weather(location: 'Dhaka'),
      Weather(location: 'Rajshahi'),
      Weather(location: 'Dinajpur'),
      Weather(location: 'Sylhet'),
      Weather(location: 'Panchagarh'),
      Weather(location: 'London'),
      Weather(location: 'New York'),
      Weather(location: 'Kuwait'),
      Weather(location: 'Toronto'),
      Weather(location: 'Sydney'),
      Weather(location: 'Paris'),
      Weather(location: 'Kolkata'),
      Weather(location: 'Istanbul'),
      Weather(location: 'Qatar'),
    ];
  }

  void updateWeather(index) async {
    Weather instance = locations[index];
    await instance.getData();

    Map transfer = {
      'location': instance.location,
      'temperature': instance.temperature,
      'temperatureMin': instance.temperatureMin,
      'temperatureMax': instance.temperatureMax,
      'condition': instance.condition,
      'icon': instance.icon,
      'time': instance.time,
      'isDay': instance.isDay
    };
    Navigator.pop(context, transfer);
  }

  @override
  void initState() {
    super.initState();
    loadLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateWeather(index);
              },
              title: Text(locations[index].location),
              leading: const Icon(Icons.location_pin),
            ),
          );
        },
      ),
    );
  }
}
