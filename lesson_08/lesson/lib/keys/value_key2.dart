import 'package:flutter/material.dart';

class ValueKeysStatefulSample extends StatefulWidget {
  @override
  _ValueKeysStatefulSampleState createState() =>
      _ValueKeysStatefulSampleState();
}

class _ValueKeysStatefulSampleState extends State<ValueKeysStatefulSample> {
  var _data = <Color>[Colors.red, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: _data
            .map((color) => ColorBox(
                  color,
                  // key: ValueKey(color), // TODO: - Sample Ch. 3
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shuffle),
        onPressed: () => setState(() => _data.insert(0, _data.removeAt(1))),
      ),
    );
  }
}

class ColorBox extends StatefulWidget {
  const ColorBox(
    this.color, {
    Key key,
  }) : super(key: key);

  final Color color;

  @override
  _ColorBoxState createState() => _ColorBoxState();
}

class _ColorBoxState extends State<ColorBox> {
  Color color;

  @override
  void initState() {
    super.initState();
    print('${widget.color}  init state');
    // color = widget.color; // TODO: - Sample Ch. 2
  }

  @override
  Widget build(BuildContext context) {
    print(
        '$color ${widget.color}  element${context.hashCode} ${context.findRenderObject().hashCode}');
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
