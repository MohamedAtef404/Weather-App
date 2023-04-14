import 'package:flutter/material.dart';
import 'package:task_flutter/models/weather_model.dart';

class weatherProvider extends ChangeNotifier {
  weatherModel? _weatherData;

  String? cityName;
  set weatherData(weatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  weatherModel? get weatherData => _weatherData;
}
