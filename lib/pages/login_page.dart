import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/models/weather_model.dart';
import 'package:task_flutter/pages/search_page.dart';
import 'package:task_flutter/providers/weather_provider.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  weatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
      //  backgroundColor: Colors.yellow,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ));
              },
              icon: const Icon(Icons.search)),
        ],
        title: const Text('weather'),
      ),

      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ' There Is No Weather Start ',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    ' Searching Now ',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.orange],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Text(
                    Provider.of<weatherProvider>(context).cityName ?? '',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Updated at: ${weatherData!.date.toString()}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        weatherData!.temp
                            .toInt()
                            .toString(), //or'${weatherData!.temp.toInt()}'
                        style: TextStyle(fontSize: 24),
                      ),
                      Column(
                        children: [
                          Text(
                            'MaxTemp : ${weatherData!.maxTemp.toInt()}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'MinTemp : ${weatherData!.minTemp.toInt()}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 70),
                  Text(
                    weatherData!.weatherStateName,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
    );
  }
}
