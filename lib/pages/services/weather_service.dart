import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_flutter/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'e3e0c2d97d0843d2882182038231401';

  Future<weatherModel?> getWeather({required String cityName}) async {
    
     weatherModel? weather;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);
    weather  = weatherModel(
          date: data['location']['localtime'],
          temp: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
          maxTemp: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
          minTemp: data['forecast']['forecastday'][0]['day']['mintemp_c'],
          weatherStateName: data['forecast']['forecastday'][0]['day']
              ['condition']['text']);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
