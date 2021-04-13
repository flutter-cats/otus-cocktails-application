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
  bool _checked = false;

  late double _width;
  late double _height;
  late Color _color;

  void _initializeContainer() {
    _width = _checked ? 400.0 : 200.0;
    _height = _checked ? 400.0 : 200.0;
    _color = _checked ? Colors.blue : Colors.red;
  }

  @override
  void initState() {
    super.initState();
    _initializeContainer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animations - AnimatedContainer'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          color: _color,
          duration: const Duration(seconds: 1),
          child: FlutterIcon(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _checked = !_checked;
            _initializeContainer();
          });
        },
        child: _checked
            ? Icon(Icons.check_box_outline_blank)
            : Icon(Icons.check_box),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
