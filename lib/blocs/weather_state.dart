part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class WeatherSuccess extends WeatherState {
  final Weather weather;
  final List<Weather> forecast;
  WeatherSuccess(this.weather, this.forecast);

  @override
  List<Object?> get props => [weather, forecast];
}
class WeatherFailure extends WeatherState {
  final String error;
  WeatherFailure(this.error);

  @override
  List<Object?> get props => [error];
}