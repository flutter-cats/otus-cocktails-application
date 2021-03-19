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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _InkWellExample(),
        const SizedBox(width: 24),
        _InkResponseExample(),
      ],
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
    return Material(
      child: InkResponse(
        onTapDown: (_) {
          setState(() => isToggled = true);
        },
        onTap: () {
          setState(() => isToggled = false);
        },
        highlightShape: BoxShape.circle,
        radius: 40,
        child: Container(
          height: 120,
          width: 120,
          child: Center(
            child: Icon(
              Icons.favorite,
              size: isToggled ? 50 : 30,
            ),
          ),
        ),
      ),
    );
  }
}
