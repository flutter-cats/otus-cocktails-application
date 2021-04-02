import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: _InputsList(),
        ),
      ),
    );
  }
}

class _InputsList extends StatelessWidget {
  const _InputsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline5;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            "Checkbox:",
            style: textStyle,
          ),
          _CheckboxExample(),
          const SizedBox(height: 24),
          Text(
            "Radio:",
            style: textStyle,
          ),
          _RadioExample(),
          const SizedBox(height: 24),
          Text(
            "Slider:",
            style: textStyle,
          ),
          _SliderExample(),
          const SizedBox(height: 24),
          Text(
            "Switch:",
            style: textStyle,
          ),
          _SwitchExample(),
          const SizedBox(height: 24),
          Text(
            "Segmented Control:",
            style: textStyle,
          ),
          const SizedBox(height: 4),
          _SegmentedControlExample(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _CheckboxExample extends StatefulWidget {
  @override
  __CheckboxExampleState createState() => __CheckboxExampleState();
}

class __CheckboxExampleState extends State<_CheckboxExample> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: _value,
          onChanged: (value) {
            setState(() => _value = value);
          },
          // tristate: true,
        ),
        Checkbox(
          value: true,
          onChanged: null,
        ),
      ],
    );
  }
}

enum EnumValue { value1, value2, value3, value4 }

class _RadioExample extends StatefulWidget {
  @override
  _RadioExampleState createState() => _RadioExampleState();
}

class _RadioExampleState extends State<_RadioExample> {
  EnumValue? _value = EnumValue.value1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<EnumValue>(
          onChanged: (value) {
            setState(() => _value = value);
          },
          groupValue: _value,
          value: EnumValue.value1,
        ),
        Radio<EnumValue>(
          onChanged: (value) {
            setState(() => _value = value);
          },
          groupValue: _value,
          value: EnumValue.value2,
        ),
        Radio<EnumValue>(
          onChanged: null,
          groupValue: _value,
          value: EnumValue.value3,
        ),
        Radio<EnumValue>(
          onChanged: (value) {
            setState(() => _value = value);
          },
          groupValue: _value,
          toggleable: true,
          value: EnumValue.value4,
        ),
      ],
    );
  }
}

class _SliderExample extends StatefulWidget {
  const _SliderExample({
    Key? key,
  }) : super(key: key);

  @override
  __SliderExampleState createState() => __SliderExampleState();
}

class __SliderExampleState extends State<_SliderExample> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Slider(
          onChanged: (double value) {
            setState(() {
              _value = value;
            });
          },
          value: _value,
          min: 0,
          max: 100,
          // divisions: 5,
          // label: _value.toString(),
        ),
        Slider.adaptive(
          onChanged: (double value) {
            setState(() {
              _value = value;
            });
          },
          value: _value,
          min: 0,
          max: 100,
        ),
      ],
    );
  }
}

class _SwitchExample extends StatefulWidget {
  @override
  __SwitchExampleState createState() => __SwitchExampleState();
}

class __SwitchExampleState extends State<_SwitchExample> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _value,
          onChanged: (bool value) {
            setState(() => _value = value);
          },
        ),
        Switch(
          value: false,
          onChanged: null,
        ),
        Switch.adaptive(
          value: _value,
          onChanged: (bool value) {
            setState(() => _value = value);
          },
        ),
      ],
    );
  }
}

class _SegmentedControlExample extends StatefulWidget {
  @override
  __SegmentedControlExampleState createState() =>
      __SegmentedControlExampleState();
}

class __SegmentedControlExampleState extends State<_SegmentedControlExample> {
  EnumValue? _value = EnumValue.value1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CupertinoSegmentedControl<EnumValue>(
          children: {
            EnumValue.value1: Text("Value1"),
            EnumValue.value2: Text("Value2"),
            EnumValue.value3: Text("Value3"),
          },
          onValueChanged: (value) {
            setState(() => _value = value);
          },
          groupValue: _value,
        ),
        const SizedBox(height: 8),
        CupertinoSlidingSegmentedControl<EnumValue>(
          children: {
            EnumValue.value1: Text("Value1"),
            EnumValue.value2: Text("Value2"),
            EnumValue.value3: Text("Value3"),
          },
          onValueChanged: (value) {
            setState(() => _value = value);
          },
          groupValue: _value,
        ),
      ],
    );
  }
}
