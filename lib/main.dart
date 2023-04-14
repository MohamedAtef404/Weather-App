import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/pages/login_page.dart';
import 'package:task_flutter/providers/weather_provider.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return weatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WeatherApp(),
      ),
    );
  }
}
