import 'package:weatherapp/model/city.dart';

abstract class StoreRepo {
  Future<void> saveCity(City city);
  Future<List<City>> getCities();
}
