// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      cityN: json['cityN'] as String,
      temp: (json['temp'] as num).toDouble(),
      des: json['des'] as String,
      icon: json['icon'] as String,
      dateT: DateTime.parse(json['dateT'] as String),
      dayN: json['dayN'] as String,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'cityN': instance.cityN,
      'temp': instance.temp,
      'des': instance.des,
      'icon': instance.icon,
      'dateT': instance.dateT.toIso8601String(),
      'dayN': instance.dayN,
    };
