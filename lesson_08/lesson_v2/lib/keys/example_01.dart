import 'package:flutter/material.dart';

class Example01 extends StatefulWidget {
  const Example01({Key? key}) : super(key: key);

  @override
  _Example01State createState() => _Example01State();
}

class _Example01State extends State<Example01> {
  final _data = <Widget>[
    const ColorBox(title: 'RED', color: Colors.red),
    const ColorBox(title: 'BLUE', color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: _data,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _data.insert(0, _data.removeAt(1))),
        child: const Icon(Icons.shuffle),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  const ColorBox({
    required this.color,
    required this.title,
    Key? key,
  }) : super(key: key);

  final Color color;
  final String title;

  /*
  Initial state:
  flutter: Title: RED; Color: MaterialColor(primary value: Color(0xfff44336));  Element: 129; Render: 2011
  flutter: Title: BLUE; Color: MaterialColor(primary value: Color(0xff2196f3));  Element: 133; Render: 2011
   */

  @override
  Widget build(BuildContext context) {
    print('Title: $title; Color: $color;  Element: ${context.hashCode}; Render: ${context.findRenderObject().hashCode}');
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
