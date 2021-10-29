// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/data/data_constants.dart';
import 'package:weatherapp/ui/common/debouncer.dart';
import 'package:weatherapp/ui/common/page_header.dart';
import 'package:http/http.dart' as http;

class AddCityPage extends StatefulWidget {
  const AddCityPage({Key? key}) : super(key: key);

  @override
  State<AddCityPage> createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  void onChangeSearch(String inText) {
    final deb = Debouncer();

    deb.run(() {
      requestSearch(inText);
    });
  }

  void requestSearch(String serText) async {
    final url = Uri.parse('${api}search/?query=$serText');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PageHeader(
              title: "Agregar Ciudades",
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: ClipRRect(
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
            ),
          ],
        ),
      ),
    );
  }
}
