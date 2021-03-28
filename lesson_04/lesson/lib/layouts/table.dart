import 'package:flutter/material.dart';
import 'package:lesson/layouts/utils.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.all(color: Colors.black),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            RectWidget(Colors.red),
            RectWidget(Colors.blue),
            RectWidget(Colors.yellow)
          ]),
          TableRow(children: [
            RectWidget(Colors.red),
            RectWidget(Colors.blue),
            RectWidget(Colors.yellow)
          ]),
          TableRow(children: [
            RectWidget(Colors.red),
            RectWidget(Colors.blue),
            RectWidget(Colors.yellow)
          ]),
          TableRow(children: [
            RectWidget(Colors.red),
            RectWidget(Colors.blue),
            RectWidget(Colors.yellow)
          ]),
        ]);
  }
}
