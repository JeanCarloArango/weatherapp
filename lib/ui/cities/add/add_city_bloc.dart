import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/data/data_constants.dart';
import 'package:weatherapp/model/city.dart';
import 'package:weatherapp/model/weather.dart';
import 'package:weatherapp/ui/common/debouncer.dart';
import 'package:http/http.dart' as http;

class AddCityBloc extends ChangeNotifier {
  final deb = Debouncer();
  List<City> cities = [];
  bool loading = false;

  void onChangeSearch(String inText) {
    deb.run(() {
      if (inText.isNotEmpty) requestSearch(inText);
    });
  }

  void requestSearch(String serText) async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));
    final url = Uri.parse('${api}search/?query=$serText');
    final response = await http.get(url);
    final data = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    //print(data);
    loading = false;
    cities = data.map((e) => City.fromJson(e)).toList();
    notifyListeners();
  }

  void addCityWeather(City city) async {
    // TODO Consultar si ya existe
    final url = Uri.parse('$api${city.id}');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final weatherData = data['consolidated_weather'] as List;
    final weathers = weatherData.map((e) => Weather.fromJson(e)).toList();
    final newCity = city.fromWeathers(weathers);
    print(newCity.toJson());
  }
}
