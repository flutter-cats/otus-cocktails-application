import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InkWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InkWell & InkResponse"),
      ),
      body: _WidgetsList(),
    );
  }
}

class _WidgetsList extends StatelessWidget {
  const _WidgetsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Press me"),
              _InkWellExample(),
            ],
          ),
          const SizedBox(width: 200),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Press me"),
              _InkResponseExample(),
            ],
          ),
        ],
      ),
    );
  }
}

class _InkWellExample extends StatefulWidget {
  @override
  __InkWellExampleState createState() => __InkWellExampleState();
}

class __InkWellExampleState extends State<_InkWellExample> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) {
        setState(() => isToggled = true);
      },
      onTap: () {
        setState(() => isToggled = false);
      },
      radius: 200,
      child: Container(
        height: 100,
        width: 100,
        child: Center(
          child: Icon(
            Icons.favorite,
            size: isToggled ? 50 : 30,
          ),
        ),
      ),
    );
  }
}

class _InkResponseExample extends StatefulWidget {
  @override
  __InkResponseExampleState createState() => __InkResponseExampleState();
}

class __InkResponseExampleState extends State<_InkResponseExample> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTapDown: (_) {
        setState(() => isToggled = true);
      },
      onTap: () {
        setState(() => isToggled = false);
      },
      highlightShape: BoxShape.circle,
      radius: 100,
      child: Container(
        height: 50,
        width: 50,
        child: Center(
          child: Icon(
            Icons.favorite,
            size: isToggled ? 50 : 30,
          ),
        ),
      ),
    );
  }
}
