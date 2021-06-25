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
        child: _CustomTraversalOrder(),
      ),
    );
  }
}

class _CustomTraversalOrder extends StatelessWidget {
  const _CustomTraversalOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Stack(
          children: [
            _FocusableItem(
              order: 2,
              initialLeftOffset: 50,
              initialTopOffset: 100,
            ),
            _FocusableItem(
              order: 1,
              initialLeftOffset: 220,
              initialTopOffset: 300,
            ),
            _FocusableItem(
              order: 3,
              initialLeftOffset: 420,
              initialTopOffset: 200,
            ),
            _FocusableItem(
              order: 4,
              initialLeftOffset: 100,
              initialTopOffset: 250,
            ),
          ],
        ),
      ),
    );
  }
}

class _FocusableItem extends StatefulWidget {
  final int order;
  final double initialTopOffset;
  final double initialLeftOffset;

  const _FocusableItem({
    Key? key,
    required this.order,
    required this.initialTopOffset,
    required this.initialLeftOffset,
  }) : super(key: key);

  @override
  __FocusableItemState createState() => __FocusableItemState();
}

class __FocusableItemState extends State<_FocusableItem> {
  bool _isFocused = false;
  final _focusNode = FocusNode();
  double _topOffset = 0;
  double _leftOffset = 0;

  @override
  void initState() {
    super.initState();

    _topOffset = widget.initialTopOffset;
    _leftOffset = widget.initialLeftOffset;

    _focusNode.addListener(() {
      setState(() => this._isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _topOffset,
      left: _leftOffset,
      child: FocusTraversalOrder(
        order: NumericFocusOrder(widget.order.toDouble()),
        child: RawKeyboardListener(
          focusNode: _focusNode,
          onKey: this._onKey,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(
                color: _isFocused ? Colors.blue : Colors.transparent,
                width: 4,
              ),
            ),
            child: Center(
              child: Text(
                widget.order.toString(),
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onKey(RawKeyEvent event) {
    if (event is! RawKeyDownEvent) return;

    if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
      setState(() => _topOffset += 10);
    }

    if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
      setState(() => _topOffset -= 10);
    }

    if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
      setState(() => _leftOffset -= 10);
    }

    if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
      setState(() => _leftOffset += 10);
    }
  }
}
