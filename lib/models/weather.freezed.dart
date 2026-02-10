// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
mixin _$Weather {
  String get cityN => throw _privateConstructorUsedError;
  double get temp => throw _privateConstructorUsedError;
  String get des => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  DateTime get dateT => throw _privateConstructorUsedError;
  String get dayN => throw _privateConstructorUsedError;

  /// Serializes this Weather to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call(
      {String cityN,
      double temp,
      String des,
      String icon,
      DateTime dateT,
      String dayN});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityN = null,
    Object? temp = null,
    Object? des = null,
    Object? icon = null,
    Object? dateT = null,
    Object? dayN = null,
  }) {
    return _then(_value.copyWith(
      cityN: null == cityN
          ? _value.cityN
          : cityN // ignore: cast_nullable_to_non_nullable
              as String,
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      des: null == des
          ? _value.des
          : des // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      dateT: null == dateT
          ? _value.dateT
          : dateT // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dayN: null == dayN
          ? _value.dayN
          : dayN // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherImplCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$WeatherImplCopyWith(
          _$WeatherImpl value, $Res Function(_$WeatherImpl) then) =
      __$$WeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cityN,
      double temp,
      String des,
      String icon,
      DateTime dateT,
      String dayN});
}

/// @nodoc
class __$$WeatherImplCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$WeatherImpl>
    implements _$$WeatherImplCopyWith<$Res> {
  __$$WeatherImplCopyWithImpl(
      _$WeatherImpl _value, $Res Function(_$WeatherImpl) _then)
      : super(_value, _then);

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityN = null,
    Object? temp = null,
    Object? des = null,
    Object? icon = null,
    Object? dateT = null,
    Object? dayN = null,
  }) {
    return _then(_$WeatherImpl(
      cityN: null == cityN
          ? _value.cityN
          : cityN // ignore: cast_nullable_to_non_nullable
              as String,
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      des: null == des
          ? _value.des
          : des // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      dateT: null == dateT
          ? _value.dateT
          : dateT // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dayN: null == dayN
          ? _value.dayN
          : dayN // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherImpl implements _Weather {
  const _$WeatherImpl(
      {required this.cityN,
      required this.temp,
      required this.des,
      required this.icon,
      required this.dateT,
      required this.dayN});

  factory _$WeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherImplFromJson(json);

  @override
  final String cityN;
  @override
  final double temp;
  @override
  final String des;
  @override
  final String icon;
  @override
  final DateTime dateT;
  @override
  final String dayN;

  @override
  String toString() {
    return 'Weather(cityN: $cityN, temp: $temp, des: $des, icon: $icon, dateT: $dateT, dayN: $dayN)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.cityN, cityN) || other.cityN == cityN) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.des, des) || other.des == des) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.dateT, dateT) || other.dateT == dateT) &&
            (identical(other.dayN, dayN) || other.dayN == dayN));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cityN, temp, des, icon, dateT, dayN);

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      __$$WeatherImplCopyWithImpl<_$WeatherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherImplToJson(
      this,
    );
  }
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required final String cityN,
      required final double temp,
      required final String des,
      required final String icon,
      required final DateTime dateT,
      required final String dayN}) = _$WeatherImpl;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$WeatherImpl.fromJson;

  @override
  String get cityN;
  @override
  double get temp;
  @override
  String get des;
  @override
  String get icon;
  @override
  DateTime get dateT;
  @override
  String get dayN;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
