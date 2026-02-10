import 'package:atmosy/repository/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api/weather_api.dart';
import 'core/theme/app_theme.dart';
import 'blocs/weather_bloc.dart';
import 'ui/screens/home_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const AtmosyApp());
}

class AtmosyApp extends StatefulWidget {
  const AtmosyApp({Key? key}) : super(key: key);
  @override
  State<AtmosyApp> createState() => _WeatherAppState();

  static _WeatherAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_WeatherAppState>();
}

class _WeatherAppState extends State<AtmosyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  void setBrightness(Brightness b) =>
      setState(() => _themeMode = b == Brightness.dark ? ThemeMode.dark : ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ThemeModeProvider(
      state: this,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => WeatherBloc(
              WeatherRepository(
                apiClient: WeatherApi( httpAtmosy:  http.Client()),
              ),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Atmosy App',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: _themeMode,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}

class ThemeModeProvider extends InheritedWidget {
  final _WeatherAppState state;
  const ThemeModeProvider({required this.state, required Widget child}) : super(child: child);

  static _WeatherAppState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeModeProvider>()?.state;

  @override
  bool updateShouldNotify(ThemeModeProvider old) => true;
}