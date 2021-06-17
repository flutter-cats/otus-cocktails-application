import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RawKeyboardListenerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: _Content(),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  final _focusNode = FocusNode();
  double _topOffset = 0;
  double _leftOffset = 0;

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKey: this._onKey,
      child: Stack(
        children: [
          Positioned(
            top: _topOffset,
            left: _leftOffset,
            child: Container(
              height: 40,
              width: 40,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }

  void _onKey(RawKeyEvent event) {
    if (event is! RawKeyDownEvent) return;

    if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
      setState(() {
        _topOffset += 10;
      });
    }

    if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
      setState(() {
        _topOffset -= 10;
      });
    }

    if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
      setState(() {
        _leftOffset -= 10;
      });
    }

    if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
      setState(() {
        _leftOffset += 10;
      });
    }
  }
}
