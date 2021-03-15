import 'package:flutter/material.dart';
import 'package:lesson/layouts/utils.dart';

// Column и Row являются Flex с той лишь разницей
// что Column переопределяет параметр direction как Axis.vertical
// a Row переопределяет параметр direction как Axis.horizontal

class FlexPage extends StatefulWidget {
  @override
  _FlexPageState createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {
  MainAxisSize mainAxisSize = MainAxisSize.min;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceAround;

  @override
  Widget build(BuildContext context) {
    return _buildSpacerSample();
  }

  Widget _buildMinMaxSample() {
    return Container(
      color: Colors.grey,
      child: Flex(
          direction: Axis.horizontal,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          children: [RectWidget(Colors.red), RectWidget(Colors.green)]),
    );
  }

  Widget _buildMainAxisAlignmentSample() {
    return Container(
      child: Column(
        children: [
          SampleRow(mainAxisAlignment: MainAxisAlignment.spaceAround),
          SampleRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
          SampleRow(mainAxisAlignment: MainAxisAlignment.spaceEvenly),
          SampleRow(mainAxisAlignment: MainAxisAlignment.center),
          SampleRow(mainAxisAlignment: MainAxisAlignment.end),
          SampleRow(mainAxisAlignment: MainAxisAlignment.start),
        ],
      ),
    );
  }

  Widget _buildFlexibleSample() {
    Widget _buildContainer(int flex) {
      return Flexible(
          flex: flex,
          fit: FlexFit.tight,
          child: Container(
            color: Colors.red,
            child: Text('$flex'),
          ));
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildContainer(1),
        _buildContainer(2),
        _buildContainer(4),
        _buildContainer(8),
        _buildContainer(16),
      ],
    );
  }

  Widget _buildSpacerSample() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        RectWidget(Colors.green),
        Spacer(),
        RectWidget(Colors.green),
        Spacer()
      ],
    );
  }
}

class SampleRow extends StatelessWidget {
  const SampleRow({Key? key, required this.mainAxisAlignment})
      : super(key: key);

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        Text(mainAxisAlignment.toString()),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [RectWidget(Colors.red), RectWidget(Colors.green), RectWidget(Colors.yellow)],
        ),
        Divider(color: Colors.black)
      ],
    );
  }
}
