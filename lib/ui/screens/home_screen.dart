import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/weather_bloc.dart';
import '../widgets/weather_card.dart';
import '../widgets/error_widget.dart';
import '../../main.dart';
import '../widgets/weather_video_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _city = "Sana";
  String? _currentWeatherIcon;
  double _currentTemp = 25;

  void _onSearch(String city) {
    if (city.trim().isEmpty) return;
    setState(() => _city = city);
    context.read<WeatherBloc>().add(WeatherRequested(city));
  }

  Future<void> _onRefresh() async {
    context.read<WeatherBloc>().add(WeatherRefreshRequested(_city));
  }

  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(WeatherRequested(_city));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final isWeb = screenWidth >= 1000;

    final smallCardWidth = isWeb
        ? 170.0
        : isTablet
        ? 160.0
        : 155.0;
    final smallCardHeight = isWeb
        ? 250.0
        : isTablet
        ? 230.0
        : 220.0;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue.shade700.withOpacity(0.85),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(1),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Atmosy App",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              if (_currentWeatherIcon != null)
                Text(
                  "${_currentTemp.round()}°C | ${_currentWeatherIcon!}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Theme.of(context).brightness == Brightness.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: Colors.white,
                ),
                onPressed: () {
                  final appState = AtmosyApp.of(context);
                  if (appState != null) {
                    final brightness = Theme.of(context).brightness;
                    appState.setBrightness(
                      brightness == Brightness.dark
                          ? Brightness.light
                          : Brightness.dark,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          if (_currentWeatherIcon != null)
            WeatherVideoBackground(
              weatherIcon: _currentWeatherIcon!,
              temp: _currentTemp,
            ),
          SafeArea(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  SearchBar(onSubmitted: _onSearch),
                  const SizedBox(height: 16),
                  BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is WeatherSuccess) {
                        // تحديث الخلفية هنا
                        _currentWeatherIcon = state.weather.icon;
                        _currentTemp = state.weather.temp;

                        return Column(
                          children: [
                            AtmosyCard(weather: state.weather, isMain: true),
                            const SizedBox(height: 16),
                            const Text(
                              '7-Day Forecast',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: smallCardHeight,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: state.forecast
                                      .map((weather) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: SizedBox(
                                      width: smallCardWidth,
                                      child: AtmosyCard(weather: weather),
                                    ),
                                  ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (state is WeatherFailure) {
                        return AppErrorWidget(
                          message: state.error,
                          onRetry: () => context
                              .read<WeatherBloc>()
                              .add(WeatherRequested(_city)),
                        );
                      }
                      return const Center(
                        child: Text("Search for a city to see weather!"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
