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
        // crossAxisAlignment: CrossAxisAlignment.stretch,
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
        final pointerOffset = value * constraints.maxWidth / 255;
        print(pointerOffset);

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            final position = details.localPosition.dx;
            final newValue = position * 255 / constraints.maxWidth;

            onChanged(newValue.toInt());
          },
          child: Stack(
            children: [
              Container(
                constraints: BoxConstraints.tightFor(height: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.black, color]),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: pointerOffset,
                child: Container(width: 6, height: 10, color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}
