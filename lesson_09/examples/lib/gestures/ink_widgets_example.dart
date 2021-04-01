import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InkWidgetsExample extends StatelessWidget {
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
  const _WidgetsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 100),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "InkWell",
              style: Theme.of(context).textTheme.headline5,
            ),
            _InkWellExample(),
          ],
        ),
        const SizedBox(height: 100),
        Center(
          child: Container(
            color: Colors.yellowAccent,
            child: _InkWellExample(),
          ),
        ),
        const SizedBox(height: 100),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "InkResponse",
              style: Theme.of(context).textTheme.headline5,
            ),
            _InkResponseExample(),
          ],
        ),
        const SizedBox(height: 100),
        Center(
          child: Container(
            color: Colors.yellowAccent,
            child: _InkResponseExample(),
          ),
        ),
        const SizedBox(height: 100),
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
