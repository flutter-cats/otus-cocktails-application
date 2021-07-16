import 'package:flutter/material.dart';

class MultipleWidgets extends StatefulWidget {
  const MultipleWidgets({Key? key}) : super(key: key);

  @override
  _MultipleWidgetsState createState() {
    return _MultipleWidgetsState();
  }
}

const count = 60;

class _MultipleWidgetsState extends State<MultipleWidgets> {
  final data = List.generate(count, (index) => index);

  Widget _buildWidget(BuildContext context, int index) {
    return CheckboxListTile(
      title: Text('${data[index]}'),
      onChanged: (value) => false,
      value: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: _buildWidget,
        itemCount: count,
      ),
    );
  }
}
