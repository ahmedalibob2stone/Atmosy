import '../core/api/weather_api.dart';
import '../core/utils/helpers.dart';
import '../models/weather.dart';

class WeatherRepository {
  final WeatherApi apiClient;
  WeatherRepository({required this.apiClient});

  Future<Weather> getWeather(String city) async {
    final data = await apiClient.fetchWeather(city);
    final date = DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000);
    return Weather(
      cityN: data['name'],
      temp: (data['main']['temp'] as num).toDouble(),
      des: data['weather'][0]['description'],
      icon: data['weather'][0]['icon'],
      dateT: date,
      dayN: dayNameFromDate(date),
    );
  }

  Future<List<Weather>> getForecast(String city) async {
    final data = await apiClient.fetchForecast(city);
    List<dynamic> list = data['list'];
    Map<String, Weather> daily = {};
    for (final item in list) {
      final dateTxt = item['dt_txt'];
      final date = DateTime.parse(dateTxt);
      final dayKey = "${date.year}-${date.month}-${date.day}";
      if (!daily.containsKey(dayKey)) {
        daily[dayKey] = Weather(
          cityN: data['city']['name'],
          temp: (item['main']['temp'] as num).toDouble(),
          des: item['weather'][0]['description'],
          icon: item['weather'][0]['icon'],
          dateT: date,
          dayN: dayNameFromDate(date),
        );
      }
      if (daily.length >= 7) break;
    }
    return daily.values.toList();
  }


}