// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:weatherapp/ui/cities/add/add_cities_page.dart';
import 'package:weatherapp/ui/common/page_header.dart';
import 'package:weatherapp/ui/ui_constraints/page_constraints.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({Key? key}) : super(key: key);

  void handleRedirectAddCity(BuildContext c) {
    //Navigator.of(c).push(MaterialPageRoute(builder: (_) => AddCityPage()));
    Navigator.of(c).push(
      PageRouteBuilder(
        transitionDuration: const Duration(
          milliseconds: 400,
        ),
        pageBuilder: (_, animation1, animation2) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.0, -1.0),
              end: Offset(0.0, 0.0),
            ).animate(animation1),
            child: AddCityPage(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => handleRedirectAddCity(context),
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PageHeader(
              title: "Mis Ciudades",
            ),
            Expanded(
              child: Center(
                child: Text(
                  "No tienes ciudades seleccionadas😭",
                  style: TextStyle(
                    fontSize: 20,
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
