import 'package:flutter/material.dart';

import 'package:beermaker/myhomepage.dart';
import 'package:beermaker/etape.dart';
import 'package:beermaker/outils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeerMaker',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'BeerMaker HomePage'),
      routes: <String, WidgetBuilder>{
        "/route2": (BuildContext context) => Etape(),
        "/route3": (BuildContext context) => Outils(),
      },
    );
  }
}
