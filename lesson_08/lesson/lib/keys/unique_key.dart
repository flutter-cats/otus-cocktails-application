import 'package:flutter/material.dart';

class UniqueKeySample extends StatefulWidget {
  @override
  _UniqueKeySampleState createState() => _UniqueKeySampleState();
}

class _UniqueKeySampleState extends State<UniqueKeySample> {
  final _data = Map<String, bool>.fromIterable(
    List.generate(5, (index) => 'item$index'),
    key: (k) => k,
    value: (k) => false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _data.keys
            .map((key) => _ListTile(
                  key: UniqueKey(), // TODO: - Sample Ch. 2
                  initialValue: _data[key],
                  title: key,
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () =>
            setState(() => _data.forEach((key, value) => _data[key] = false)),
      ),
    );
  }
}

class _ListTile extends StatefulWidget {
  const _ListTile({
    Key key,
    this.initialValue,
    this.title = '',
  }) : super(key: key);

  final bool initialValue;

  final String title;

  @override
  _ListTileState createState() => _ListTileState();
}

class _ListTileState extends State<_ListTile> {
  bool value;

  static const _selectedTextStyle = TextStyle(color: Colors.green);
  static const _textStyle = TextStyle(color: Colors.black);

  @override
  void initState() {
    super.initState();
    value = widget.initialValue ?? false;
    print('${widget.title} initState');
  }

  @override
  Widget build(BuildContext context) {
    print(
        '${widget.title} element:${context.hashCode} render:${context.findRenderObject()?.hashCode}');
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
