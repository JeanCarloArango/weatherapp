// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/data/data_constants.dart';
import 'package:weatherapp/model/city.dart';
import 'package:weatherapp/ui/common/debouncer.dart';
import 'package:weatherapp/ui/common/loader_widget.dart';
import 'package:weatherapp/ui/common/page_header.dart';
import 'package:http/http.dart' as http;

class AddCityPage extends StatefulWidget {
  const AddCityPage({Key? key}) : super(key: key);

  @override
  State<AddCityPage> createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  final deb = Debouncer();
  List<City> cities = [];
  bool loading = false;

  void onChangeSearch(String inText) {
    deb.run(() {
      if (inText.isNotEmpty) requestSearch(inText);
    });
  }

  void requestSearch(String serText) async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    /*final url = Uri.parse('${api}search/?query=$serText');
    final response = await http.get(url);
    final data = jsonDecode(response.body) as List;*/
    setState(() {
      loading = false;
      cities = [
        City('Bogota', 111)
      ]; //data.map((e) => City.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PageHeader(
                title: "Agregar Ciudades",
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: TextField(
                  onChanged: onChangeSearch,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: "Buscar ciudad",
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    final city = cities[index];
                    return ListTile(
                      title: Text(
                        city.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    );
                  },
                ),
              ),
              if (loading)
                Center(
                  child: LoaderWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
