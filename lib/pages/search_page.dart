import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/models/weather_model.dart';
import 'package:task_flutter/pages/services/weather_service.dart';
import 'package:task_flutter/providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('search a city'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                WeatherService service = WeatherService();

                weatherModel? weather =
                    await service.getWeather(cityName: cityName!);

                Provider.of<weatherProvider>(context, listen: false)
                    .weatherData = weather;
                Provider.of<weatherProvider>(context, listen: false).cityName =
                    cityName;

                Navigator.pop(context);
              },
              decoration: InputDecoration(
                labelText: 'search',
                hintText: 'enter city name',

                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatherService service = WeatherService();

                      weatherModel? weather =
                          await service.getWeather(cityName: cityName!);
                      Provider.of<weatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<weatherProvider>(context, listen: false)
                          .cityName = cityName;

                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3)),
                // enabledBorder: OutlineInputBorder(
                //    borderSide: BorderSide(color: Colors.red, width: 3)),
                // focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.yellow, width: 3))),
              )),
        ));
  }
}
