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
      padding: const EdgeInsets.all(24),
      physics: ClampingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            LifecycleExample(),
            const SizedBox(height: 100),
            _ColorPicker(),
            const SizedBox(height: 100),
            Text(
              "GestureDetector перекрывает GestureDetector:",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            _StackedGestureDetectors(),
            const SizedBox(height: 100),
            Text(
              "GestureDetector внутри GestureDetector:",
              style: Theme.of(context).textTheme.headline6,
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

class LifecycleExample extends StatefulWidget {
  @override
  _LifecycleExampleState createState() => _LifecycleExampleState();
}

class _LifecycleExampleState extends State<LifecycleExample> {
  String type = "";

  void _updateType(String value) {
    setState(() => type = value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragDown: (details) {
        _updateType("onHorizontalDragDown");
      },
      onHorizontalDragStart: (details) {
        _updateType("onHorizontalDragStart");
      },
      onHorizontalDragUpdate: (details) {
        _updateType("onHorizontalDragUpdate");
      },
      onHorizontalDragCancel: () {
        _updateType("onHorizontalDragCancel");
      },
      onHorizontalDragEnd: (details) {
        _updateType("onHorizontalDragEnd");
      },
      child: Container(
        width: 320,
        color: Colors.amber,
        padding: EdgeInsets.all(8),
        child: Center(
          child: Text(
            type,
            style: Theme.of(context).textTheme.headline6,
          ),
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
            height: 80,
            width: 80,
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

  static const _pointerWidth = 8.0;

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
                height: 20,
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

enum DetectorStatus { none, tapDown, tap }

class StatusLabel extends StatelessWidget {
  final DetectorStatus status;

  const StatusLabel({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(fontSize: 16),
    );
  }

  String get _text {
    switch (status) {
      case DetectorStatus.none:
        return "";
      case DetectorStatus.tapDown:
        return "Tap down";
      case DetectorStatus.tap:
        return "Tap";
    }
  }
}

class _StackedGestureDetectors extends StatefulWidget {
  @override
  _StackedGestureDetectorsState createState() =>
      _StackedGestureDetectorsState();
}

class _StackedGestureDetectorsState extends State<_StackedGestureDetectors> {
  DetectorStatus innerStatus = DetectorStatus.none;
  DetectorStatus outerStatus = DetectorStatus.none;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTapDown: (_) {
              setState(() => innerStatus = DetectorStatus.tapDown);
            },
            onTapCancel: () {
              setState(() => innerStatus = DetectorStatus.none);
            },
            onTap: () {
              setState(() => innerStatus = DetectorStatus.tap);
            },
            child: Container(
              height: 100,
              width: 100,
              color: Color(0x8882cbb2),
              child: Center(
                child: StatusLabel(
                  status: innerStatus,
                ),
              ),
            ),
          ),
          Positioned(
            top: 14,
            child: StatusLabel(
              status: outerStatus,
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              // behavior: HitTestBehavior.opaque,
              onTapDown: (_) {
                setState(() => outerStatus = DetectorStatus.tapDown);
              },
              onTapCancel: () {
                setState(() => outerStatus = DetectorStatus.none);
              },
              onTap: () {
                setState(() => outerStatus = DetectorStatus.tap);
              },
            ),
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
  DetectorStatus innerStatus = DetectorStatus.none;
  DetectorStatus outerStatus = DetectorStatus.none;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => outerStatus = DetectorStatus.tapDown);
      },
      onTapCancel: () {
        setState(() => outerStatus = DetectorStatus.none);
      },
      onTap: () {
        setState(() => outerStatus = DetectorStatus.tap);
      },
      child: Container(
        height: 200,
        width: 200,
        color: const Color(0xffc7ceea),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 14,
                child: StatusLabel(
                  status: outerStatus,
                ),
              ),
              Center(
                child: GestureDetector(
                  onTapDown: (_) {
                    setState(() => innerStatus = DetectorStatus.tapDown);
                  },
                  onTapCancel: () {
                    setState(() => innerStatus = DetectorStatus.none);
                  },
                  onTap: () {
                    setState(() => innerStatus = DetectorStatus.tap);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: const Color(0xfff4ebc1),
                    child: Center(
                      child: StatusLabel(
                        status: innerStatus,
                      ),
                    ),
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
