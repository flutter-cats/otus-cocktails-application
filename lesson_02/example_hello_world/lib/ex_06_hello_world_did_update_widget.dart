import 'package:flutter/material.dart';

void main() {
  runApp(HelloWorldDecorationWidget());
}

//
// =======================
//
// HelloWorldDecorationWidget
class HelloWorldDecorationWidget extends StatefulWidget {
  @override
  _HelloWorldDecorationWidgetState createState() =>
      _HelloWorldDecorationWidgetState();
}

class _HelloWorldDecorationWidgetState
    extends State<HelloWorldDecorationWidget> {
  bool _isShapeCircle;
  String _title;

  @override
  void initState() {
    super.initState();
    _isShapeCircle = false;
    _title = _getTitle(_isShapeCircle);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _isShapeCircle = !_isShapeCircle;
        _title = _getTitle(_isShapeCircle);
      }),
      child: Container(
        decoration: BoxDecoration(
          shape: _isShapeCircle ? BoxShape.circle : BoxShape.rectangle,
          color: _isShapeCircle ? Colors.lime : Colors.lightGreen,
        ),
        alignment: Alignment.center,
        child: HelloWorldTitleOnlyWidget(
          title: _title,
        ),
      ),
    );
  }

  String _getTitle(bool isShapeCircle) =>
      isShapeCircle ? 'World is in a Circle' : 'World is in a Rect';
}

//
// =======================
//
// HelloWorldTitleOnlyWidget
class HelloWorldTitleOnlyWidget extends StatefulWidget {
  final String title;

  HelloWorldTitleOnlyWidget({
    Key key,
    @required this.title,
  }) : super(key: key) {
    //  TODO: uncomment this
    //  print('1. HelloWorldTitleOnlyWidget ctor');
  }

  @override
  _HelloWorldTitleOnlyWidgetState createState() =>
      _HelloWorldTitleOnlyWidgetState();
}

class _HelloWorldTitleOnlyWidgetState extends State<HelloWorldTitleOnlyWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textDirection: TextDirection.ltr,
      style: TextStyle(color: Colors.black, fontSize: 40),
    );
  }

  @override
  void didUpdateWidget(HelloWorldTitleOnlyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    //  TODO: uncomment this
    print(
        'Old widget title is ${oldWidget.title}, current title is ${widget.title}');
  }

  _HelloWorldTitleOnlyWidgetState() {
    //  TODO: uncomment this
    //  print('2. _HelloWorldTitleOnlyWidgetState ctor');
  }
}
