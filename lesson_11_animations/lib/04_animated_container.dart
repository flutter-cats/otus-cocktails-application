import 'package:flutter/material.dart';
import 'package:lesson_11_animations/common/flutter_icon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,

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
        title: Text('Implicit Animations - AnimatedContainer'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: 200,
          height: 200,
          color: Colors.blue,
          duration: const Duration(seconds: 1),
          child: FlutterIcon(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
