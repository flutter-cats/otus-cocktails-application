import 'package:flutter/material.dart';

void main() {
  runApp(MyOwnWidget());
}

class MyOwnWidget extends StatefulWidget {
  @override
  _MyOwnWidgetState createState() => _MyOwnWidgetState();
}

class _MyOwnWidgetState extends State<MyOwnWidget> {
  bool _isShapeCircle;

  @override
  void initState() {
    super.initState();
    print('initState');
    _isShapeCircle = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(MyOwnWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isShapeCircle = !_isShapeCircle),
      child: Container(
        decoration: BoxDecoration(
          shape: _isShapeCircle ? BoxShape.circle : BoxShape.rectangle,
          color: _isShapeCircle ? Colors.lime : Colors.lightGreen,
        ),
        alignment: Alignment.center,
        child: Text(
          'Hello, world!',
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.black, fontSize: 40),
        ),
      ),
    );
  }
}
