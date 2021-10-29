import 'package:weatherapp/model/weather.dart';

class City {
  final String name;
  final int id;
  List<Weather> weathers = [];

  City(this.name, this.id, this.weathers);

  City.withoutWeathers(this.name, this.id);

  factory City.fromJson(Map<String, dynamic> json) {
    return City.withoutWeathers(
      json['title'],
      json['woeid'],
    );
  }

  City fromWeathers(List<Weather> weathers) {
    return City(name, id, weathers);
  }

  Map<String, dynamic> toJson() => {
        "title": name,
        "woeid": id,
        "weathers": weathers.map((e) => e.toJson()),
      };
}
