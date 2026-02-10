import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/weather.dart';
import '../repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc(this.repository) : super(WeatherInitial()) {
    on<WeatherRequested>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await repository.getWeather(event.city);
        final forecast = await repository.getForecast(event.city);
        emit(WeatherSuccess(weather, forecast));
      } catch (e) {
        emit(WeatherFailure(e.toString()));
      }
    });

    on<WeatherRefreshRequested>((event, emit) async {
      try {
        final weather = await repository.getWeather(event.city);
        final forecast = await repository.getForecast(event.city);
        emit(WeatherSuccess(weather, forecast));
      } catch (e) {
        emit(WeatherFailure(e.toString()));
      }
    });
  }
}