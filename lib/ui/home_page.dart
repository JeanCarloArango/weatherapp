// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weatherapp/ui/cities/cities_page.dart';
import 'package:weatherapp/ui/ui_constraints/page_constraints.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void handleRedirectCities(BuildContext c) {
    Navigator.of(c).push(MaterialPageRoute(builder: (_) => CitiesPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child: FittedBox(
          child: Image.asset('assets/welcome.jpg'),
          fit: BoxFit.fill,
        )),
        SafeArea(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: maxPageWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/logo.png',
                    height: 50,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Hola\nBienvenido",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Que tal si agregamos\nuna ciudad?",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => handleRedirectCities(context),
                    child: Text("Agrega una ciudad"),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 20, letterSpacing: 2),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
