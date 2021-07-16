import 'package:flutter/material.dart';

class Example02 extends StatefulWidget {
  const Example02({Key? key}) : super(key: key);

  @override
  _Example02State createState() => _Example02State();
}

class _Example02State extends State<Example02> {
  final _colors = <Color>[Colors.red, Colors.blue];
  final _titles = <String>['RED', 'BLUE'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          for (int i = 0; i < _colors.length; i++)
            ColorBox(
              title: _titles[i],
              color: _colors[i],
              // TODO(alphamikle): - Sample Ch. 3
              key: ValueKey(_colors[i]),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _colors.insert(0, _colors.removeAt(1));
            _titles.insert(0, _titles.removeAt(1));
          });
        },
        child: const Icon(Icons.shuffle),
      ),
    );
  }
}

class ColorBox extends StatefulWidget {
  const ColorBox({
    required this.color,
    required this.title,
    Key? key,
  }) : super(key: key);

  final Color color;
  final String title;

  @override
  _ColorBoxState createState() => _ColorBoxState();
}

class _ColorBoxState extends State<ColorBox> {
  Color? color;

  @override
  void initState() {
    super.initState();
    print('${widget.color}  init state');
    // TODO(alphamikle): - Sample Ch. 2
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    print('TITLE: ${widget.title}; COLOR: $color; W.COLOR: ${widget.color}; element${context.hashCode} ${context.findRenderObject().hashCode}');
    return Container(
      width: 100,
      height: 100,
      color: color ?? widget.color,
    );
  }
}
