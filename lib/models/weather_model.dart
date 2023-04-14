class weatherModel {
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStateName;
  weatherModel(
    {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});
}
