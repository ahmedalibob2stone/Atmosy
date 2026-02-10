import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WeatherVideoBackground extends StatefulWidget {
  final String weatherIcon;
  final double temp;

  const WeatherVideoBackground({
    Key? key,
    required this.weatherIcon,
    required this.temp,
  }) : super(key: key);

  @override
  State<WeatherVideoBackground> createState() => _WeatherVideoBackgroundState();
}

class _WeatherVideoBackgroundState extends State<WeatherVideoBackground> {
  late VideoPlayerController _controller;
  String? _videoPath;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _videoPath = getWeatherVideo(widget.weatherIcon, widget.temp);
    _controller = VideoPlayerController.asset(_videoPath!)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void didUpdateWidget(covariant WeatherVideoBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.weatherIcon != widget.weatherIcon ||
        oldWidget.temp != widget.temp) {
      _controller.pause();
      _controller.dispose();
      _initializeVideo();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String getWeatherVideo(String icon, double temp) {
    bool isNight = icon.endsWith('n');
    if (icon.startsWith('01')) {
      return temp >= 33 ? 'assets/videos/hotSun.mp4' : 'assets/videos/clear.mp4';
    }
    if (icon.startsWith('02') || icon.startsWith('03')) {
      return temp > 20 ? 'assets/videos/windy2.mp4' : 'assets/videos/clear.mp4';
    }
    if (icon.startsWith('04')) {
      return 'assets/videos/weather-icon-with-rain-cloud-with-water-drops.mp4'; // مطر ليلي
    }
    if (icon.startsWith('09') || icon.startsWith('10')) {
      return isNight
          ? 'assets/images/raining_night.png'
          : 'assets/images/raining.png';
    }
    if (icon.startsWith('11')) {
      return 'assets/videos/strom.mp4';
    }
    if (icon.startsWith('13')) {
      if (temp <= -2) {
        return isNight
            ? 'assets/videos/snow2'
            : 'assets/videos/snow_day';
      }

    }
    if (icon.startsWith('50')) {
      return 'assets/videos/cloud.mp4'; // ضباب / سحب
    }
    return 'assets/videos/clear.mp4';
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    )
        : Container(color: Colors.blue); // خلفية احتياطية
  }
}
