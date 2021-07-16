import 'package:flutter/material.dart';

class Example04 extends StatefulWidget {
  const Example04({Key? key}) : super(key: key);

  @override
  _Example04State createState() => _Example04State();
}

class _Example04State extends State<Example04> {
  final _data = Map<String, bool>.fromIterable(
    List<String>.generate(5, (index) => 'item$index'),
    key: (dynamic key) => key.toString(),
    value: (dynamic value) => false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyedSubtree(
        key: UniqueKey(),
        child: ListView(
          children: _data.keys
              .map(
                (String key) => _ListTile(
                  // TODO(alphamikle): - Sample Ch. 2
                  key: UniqueKey(),
                  initialValue: _data[key]!,
                  title: key,
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _data.forEach((key, value) => _data[key] = false)),
        child: const Icon(Icons.clear),
      ),
    );
  }
}

class _ListTile extends StatefulWidget {
  const _ListTile({
    required this.initialValue,
    this.title = '',
    Key? key,
  }) : super(key: key);

  final bool initialValue;

  final String title;

  @override
  _ListTileState createState() => _ListTileState();
}

class _ListTileState extends State<_ListTile> {
  late bool value;

  static const _selectedTextStyle = TextStyle(color: Colors.green);
  static const _textStyle = TextStyle(color: Colors.black);

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    print('${widget.title} initState');
  }

  @override
  Widget build(BuildContext context) {
    print('--> ${widget.title}; value: $value; element:${context.hashCode} render:${context.findRenderObject()?.hashCode}');
    return ListTile(
      title: Text(
        widget.title,
        style: value ? _selectedTextStyle : _textStyle,
      ),
      trailing: Switch.adaptive(
        value: value,
        onChanged: (value) => setState(() => this.value = value),
      ),
    );
  }
}
