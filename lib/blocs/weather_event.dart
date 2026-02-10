part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherRequested extends WeatherEvent {
  final String city;
  WeatherRequested(this.city);

  @override
  List<Object?> get props => [city];
}

class WeatherRefreshRequested extends WeatherEvent {
  final String city;
  WeatherRefreshRequested(this.city);

  @override
  List<Object?> get props => [city];
}