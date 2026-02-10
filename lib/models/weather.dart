import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {

  const factory Weather({
    required String cityN,
    required double temp,
    required String des,
    required String icon,
    required DateTime dateT,
    required String dayN,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}