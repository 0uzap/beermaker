import 'dart:async';

import 'package:beermaker/strings.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration:
          const BoxDecoration(image: DecorationImage(image: AssetImage("Assets/Images/bgor.png"), fit: BoxFit.cover)),
      child: Image.asset("Assets/Images/beermakerlogo3000.png"),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(Strings.titreAppBar)],
        )),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 200,
                  width: 650,
                  child: ElevatedButton(
                    onPressed: (() => Navigator.pushNamed(context, "/route2")),
                    child: const Text(
                      Strings.texteButton1,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    )),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 200,
                  width: 650,
                  child: ElevatedButton(
                    onPressed: (() => Navigator.pushNamed(context, "/route3")),
                    child: const Text(
                      Strings.texteButton2,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    )),
                ),
              ],
            )
        )
        );
  }
}
