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
    return ListView(
      children: [
        const SizedBox(height: 60),
        Center(child: _ColorPicker()),
        const SizedBox(height: 100),
        Center(
          child: _MultiGestureDetectors(),
        ),
      ],
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
            if (position < 0) position = 0;
            if (position > width) position = width;

            final newValue = position * 255 / width;
            onChanged(newValue.toInt());
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
}

//todo on pan? on scale?

class _MultiGestureDetectors extends StatefulWidget {
  @override
  __MultiGestureDetectorsState createState() => __MultiGestureDetectorsState();
}

class __MultiGestureDetectorsState extends State<_MultiGestureDetectors> {
  bool isInnerTapped = false;
  bool isOuterTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTapDown: (_) {
        setState(() => isOuterTapped = true);
      },
      onTapCancel: () {
        setState(() => isOuterTapped = false);
      },
      onTap: () {
        setState(() => isOuterTapped = false);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // GestureDetector(
          //   behavior: HitTestBehavior.translucent,
          //   onTapDown: (_) {
          //     setState(() => isOuterTapped = true);
          //   },
          //   onTapCancel: () {
          //     setState(() => isOuterTapped = false);
          //   },
          //   onTap: () {
          //     setState(() => isOuterTapped = false);
          //   },
          //   child: Container(
          //     height: 200,
          //     width: 200,
          //     color: Color(0xfffedfdc),
          //   ),
          // ),
          Container(
            height: 200,
            width: 200,
            color: Color(0xfffedfdc),
          ),
          if (isOuterTapped)
            Positioned(
              top: 14,
              child: Text(
                "It's a tap",
                style: TextStyle(fontSize: 16),
              ),
            ),
          GestureDetector(
            // behavior: HitTestBehavior.opaque,
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
                        "It's a tap",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
