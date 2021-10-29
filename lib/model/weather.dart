// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

List<Weather> weatherFromJson(String str) => List<Weather>.from(
      json.decode(str).map((x) => Weather.fromJson(x)),
    );

String weatherToJson(List<Weather> data) => json.encode(
      List<dynamic>.from(data.map((x) => x.toJson())),
    );

class Weather {
  Weather(
    this.id,
    this.weatherStateName,
    this.weatherStateAbbr,
    this.windDirectionCompass,
    this.created,
    this.applicableDate,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.windSpeed,
    this.windDirection,
    this.airPressure,
    this.humidity,
    this.visibility,
    this.predictability,
  );

  int id;
  String weatherStateName;
  String weatherStateAbbr;
  String windDirectionCompass;
  DateTime created;
  DateTime applicableDate;
  double minTemp;
  double maxTemp;
  double theTemp;
  double windSpeed;
  double windDirection;
  double airPressure;
  int humidity;
  double visibility;
  int predictability;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        json["id"],
        json["weather_state_name"],
        json["weather_state_abbr"],
        json["wind_direction_compass"],
        DateTime.parse(json["created"]),
        DateTime.parse(json["applicable_date"]),
        json["min_temp"].toDouble(),
        json["max_temp"].toDouble(),
        json["the_temp"].toDouble(),
        json["wind_speed"].toDouble(),
        json["wind_direction"].toDouble(),
        json["air_pressure"],
        json["humidity"],
        json["visibility"].toDouble(),
        json["predictability"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weather_state_name": weatherStateName,
        "weather_state_abbr": weatherStateAbbr,
        "wind_direction_compass": windDirectionCompass,
        "created": created.toIso8601String(),
        "applicable_date":
            "${applicableDate.year.toString().padLeft(4, '0')}-${applicableDate.month.toString().padLeft(2, '0')}-${applicableDate.day.toString().padLeft(2, '0')}",
        "min_temp": minTemp,
        "max_temp": maxTemp,
        "the_temp": theTemp,
        "wind_speed": windSpeed,
        "wind_direction": windDirection,
        "air_pressure": airPressure,
        "humidity": humidity,
        "visibility": visibility,
        "predictability": predictability,
      };
}
