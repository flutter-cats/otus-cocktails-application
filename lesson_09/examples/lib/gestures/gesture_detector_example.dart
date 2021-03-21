import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GestureDetectorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureDetector"),
      ),
      body: _Examples(),
    );
  }
}

class _Examples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            _ColorPicker(),
            const SizedBox(height: 100),
            Text(
              "GestureDetector перекрывает GestureDetector:",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8),
            _StackedGestureDetectors(),
            const SizedBox(height: 100),
            Text(
              "GestureDetector внутри GestureDetector:",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8),
            _ChildGestureDetectors(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _ColorPicker extends StatefulWidget {
  @override
  __ColorPickerState createState() => __ColorPickerState();
}

class __ColorPickerState extends State<_ColorPicker> {
  int r = 0;
  int g = 0;
  int b = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _HorizontalChannelPicker(
                  value: r,
                  color: Color.fromARGB(255, 255, 0, 0),
                  onChanged: (value) {
                    setState(() => r = value);
                  },
                ),
                const SizedBox(height: 20),
                _HorizontalChannelPicker(
                  value: g,
                  color: Color.fromARGB(255, 0, 255, 0),
                  onChanged: (value) {
                    setState(() => g = value);
                  },
                ),
                const SizedBox(height: 20),
                _HorizontalChannelPicker(
                  value: b,
                  color: Color.fromARGB(255, 0, 0, 255),
                  onChanged: (value) {
                    setState(() => b = value);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Container(
            height: 100,
            width: 100,
            color: Color.fromARGB(255, r, g, b),
          ),
        ],
      ),
    );
  }
}

class _HorizontalChannelPicker extends StatelessWidget {
  final int value;
  final Color color;
  final ValueSetter<int> onChanged;

  static const _pointerWidth = 6.0;

  const _HorizontalChannelPicker({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final pointerOffset = value * constraints.maxWidth / 255;

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            var position = details.localPosition.dx;
            _update(position, width);
          },
          onTapDown: (details) {
            var position = details.localPosition.dx;
            _update(position, width);
          },
          child: Stack(
            children: [
              Container(
                height: 10,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.black, color]),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: pointerOffset - _pointerWidth / 2,
                child: Container(
                    width: _pointerWidth, height: 10, color: Colors.tealAccent),
              ),
            ],
          ),
        );
      },
    );
  }

  void _update(double position, double width) {
    if (position < 0) position = 0;
    if (position > width) position = width;

    final newValue = position * 255 / width;
    onChanged(newValue.toInt());
  }
}

//todo on pan? on scale?

class _StackedGestureDetectors extends StatefulWidget {
  @override
  _StackedGestureDetectorsState createState() =>
      _StackedGestureDetectorsState();
}

class _StackedGestureDetectorsState extends State<_StackedGestureDetectors> {
  bool isInnerTapped = false;
  bool isOuterTapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Color(0xfffedfdc),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          GestureDetector(
            onTapDown: (_) {
              setState(() => isInnerTapped = true);
            },
            onTapCancel: () {
              setState(() => isInnerTapped = false);
            },
            onTap: () {
              setState(() => isInnerTapped = false);
            },
            child: Container(
              height: 100,
              width: 100,
              color: Color(0x8882cbb2),
              child: isInnerTapped
                  ? Center(
                      child: Text(
                        "Tap down",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : null,
            ),
          ),
          if (isOuterTapped)
            Positioned(
              top: 14,
              child: Text(
                "Tap down",
                style: TextStyle(fontSize: 16),
              ),
            ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTapDown: (_) {
              setState(() => isOuterTapped = true);
            },
            onTapCancel: () {
              setState(() => isOuterTapped = false);
            },
            onTap: () {
              setState(() => isOuterTapped = false);
            },
          ),
        ],
      ),
    );
  }
}

class _ChildGestureDetectors extends StatefulWidget {
  @override
  _ChildGestureDetectorsState createState() => _ChildGestureDetectorsState();
}

class _ChildGestureDetectorsState extends State<_ChildGestureDetectors> {
  bool isInnerTapped = false;
  bool isOuterTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => isOuterTapped = true);
      },
      onTapCancel: () {
        setState(() => isOuterTapped = false);
      },
      onTap: () {
        setState(() => isOuterTapped = false);
      },
      child: Container(
        height: 200,
        width: 200,
        color: Color(0xffc7ceea),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isOuterTapped)
                Positioned(
                  top: 14,
                  child: Text(
                    "Tap down",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              Center(
                child: GestureDetector(
                  onTapDown: (_) {
                    setState(() => isInnerTapped = true);
                  },
                  onTapCancel: () {
                    setState(() => isInnerTapped = false);
                  },
                  onTap: () {
                    setState(() => isInnerTapped = false);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Color(0xfff4ebc1),
                    child: isInnerTapped
                        ? Center(
                            child: Text(
                              "Tap down",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
