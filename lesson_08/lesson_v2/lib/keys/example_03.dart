import 'package:flutter/material.dart';

class Example03 extends StatefulWidget {
  const Example03({Key? key}) : super(key: key);

  @override
  _Example03State createState() => _Example03State();
}

class _Example03State extends State<Example03> {
  final _data = <Color>[Colors.red, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ReorderableListView(
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              _data.insert(newIndex, _data.removeAt(oldIndex));
            });
          },
          children: _data
              .map(
                (e) => ColorBox(
                  e,
                  // TODO(alphamikle): - Sample Ch. 1 - comment this out
                  key: ValueKey(e),
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _data.insert(0, _data.removeAt(1))),
        child: const Icon(Icons.shuffle),
      ),
    );
  }
}

class ColorBox extends StatefulWidget {
  const ColorBox(
    this.color, {
    Key? key,
  }) : super(key: key);

  final Color color;

  @override
  _ColorBoxState createState() => _ColorBoxState();
}

class _ColorBoxState extends State<ColorBox> {
  late Color color;

  @override
  void initState() {
    super.initState();
    print('${widget.color}  init state');
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    print('$color ${widget.color}  element${context.hashCode} ${context.findRenderObject().hashCode}');
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
