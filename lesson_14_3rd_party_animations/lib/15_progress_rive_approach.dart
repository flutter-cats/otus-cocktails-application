import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Animations - Rive'),
      ),
      body: Center(
        child: Container(
          height: 300,
          child: Stack(
            children: <Widget>[
              FlareActor(
                'assets/rive/loader_cat_from_lottie.flr',
                animation: 'Animations',
              )
              // Lottie.asset('assets/lottie/circle-venn-diagram-spherical-octahedron.json'),
            ],
          ),
        ),
      ),
    );
  }
}
