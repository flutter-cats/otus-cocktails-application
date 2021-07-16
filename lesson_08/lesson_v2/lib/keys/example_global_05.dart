import 'package:flutter/material.dart';

class ExampleGlobal05 extends StatefulWidget {
  const ExampleGlobal05({Key? key}) : super(key: key);

  @override
  _ExampleGlobal05State createState() => _ExampleGlobal05State();
}

class _ExampleGlobal05State extends State<ExampleGlobal05> {
  final _data = {
    GlobalKey(): List.generate(5, (index) => 'item$index'),
    GlobalKey(): List.generate(6, (index) => 'item$index'),
  };

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((c) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(
              top: _getSize(_data.keys.last)?.height ?? 0,
            ),
            child: _SomeBox(
              color: Colors.red,
              key: _data.keys.first,
              items: _data[_data.keys.first]!,
            ),
          ),
          _SomeBox(
            color: Colors.blue,
            key: _data.keys.last,
            items: _data[_data.keys.last]!,
          )
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _data[_data.keys.last]!.add('value')),
              child: const Text('Plant a new item'),
            )
          ],
        ),
      ),
    );
  }
}

class _SomeBox extends StatelessWidget {
  const _SomeBox({
    required this.items,
    required this.color,
    Key? key,
  }) : super(key: key);

  final List<String> items;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...items.map((e) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Text(e),
            );
          }),
        ],
      ),
    );
  }
}

Size? _getSize(GlobalKey key) {
  final RenderBox? renderObject = key.currentContext?.findRenderObject() as RenderBox?;
  return renderObject?.size;
}
