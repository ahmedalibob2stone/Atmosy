import 'package:flutter/material.dart';
import '../../models/weather.dart';

class AtmosyCard extends StatelessWidget {
  final Weather weather;
  final bool isMain;

  const AtmosyCard({
    Key? key,
    required this.weather,
    this.isMain = false,
  }) : super(key: key);

  String getWeatherImage(String icon, double temp) {
    bool isNight = icon.endsWith('n');

    if (icon.startsWith('01')) {
      return temp >= 33
          ? 'assets/images/hotSun.png'
          : 'assets/images/clear.png';
    }
    if (icon.startsWith('02') || icon.startsWith('03')) {
      return temp > 20
          ? 'assets/images/windy2.png'
          : 'assets/images/clear.png';
    }
    if (icon.startsWith('04')) {
      return 'assets/images/weather-icon-with-rain-cloud-with-water-drops.jpg';
    }

    if (icon.startsWith('09') || icon.startsWith('10')) {
      return isNight
          ? 'assets/videos/raining_night.mp4'
          : 'assets/videos/raining.mp4';
    }
    if (icon.startsWith('11')) return 'assets/images/strom.png';
    if (icon.startsWith('13')) {
      // ثلج قوي (برودة شديدة)
      if (temp <= -2) {
        return isNight
            ? 'assets/images/snow.png'
            : 'assets/images/snow2.png';
      }

    }
    if (icon.startsWith('50')) return 'assets/images/cloud.png'; // سحب
    return 'assets/images/clear.png';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final isWeb = screenWidth >= 1000;

    final cardMinHeight = isMain
        ? (isWeb ? 320.0 : isTablet ? 290.0 : 260.0)
        : (isWeb ? 240.0 : isTablet ? 220.0 : 200.0);

    final titleFontSize = isMain
        ? (isWeb ? 26.0 : isTablet ? 24.0 : 22.0)
        : (isWeb ? 16.0 : 14.0);

    final tempFontSize = isMain
        ? (isWeb ? 40.0 : isTablet ? 36.0 : 34.0)
        : (isWeb ? 18.0 : 16.0);

    final imageSize = isMain
        ? (isWeb ? 110.0 : isTablet ? 95.0 : 80.0)
        : (isWeb ? 60.0 : 45.0);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: isMain ? 12 : 3,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: cardMinHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: isMain
                ? LinearGradient(
              colors: [Colors.blue[300]!, Colors.blue[700]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
                : LinearGradient(
              colors: [Colors.grey[200]!, Colors.grey[50]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(isWeb ? 20 : 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isMain)
                  Text(
                    weather.dayN,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                Text(
                  weather.cityN,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: isMain ? Colors.white : Colors.blueGrey[900],
                  ),
                ),
                SizedBox(height: isWeb ? 14 : 10),
                Image.asset(
                  getWeatherImage(weather.icon, weather.temp),
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: isWeb ? 14 : 10),
                Text(
                  '${weather.temp.round()}°C',
                  style: TextStyle(
                    fontSize: tempFontSize,
                    fontWeight: FontWeight.bold,
                    color: isMain ? Colors.white : Colors.blueGrey[900],
                  ),
                ),
                Text(
                  weather.des,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: isWeb ? 14 : 12,
                    color: isMain ? Colors.white : Colors.blueGrey[900],
                  ),
                ),
                if (!isMain) ...[
                  const SizedBox(height: 8),
                  Text(
                    '${weather.dateT.day}/${weather.dateT.month}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
