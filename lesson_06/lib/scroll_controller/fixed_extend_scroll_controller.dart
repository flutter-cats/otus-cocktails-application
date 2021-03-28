import 'package:flutter/material.dart';

import '../builder_delegates.dart';

class FixedScrollControllerSamplePage extends StatefulWidget {
  @override
  _FixedScrollControllerSamplePageState createState() =>
      _FixedScrollControllerSamplePageState();
}

class _FixedScrollControllerSamplePageState
    extends State<FixedScrollControllerSamplePage> {
  final controller = FixedExtentScrollController();

  final items = List.generate(500, (index) => index);

  final itemExtent = 75.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildListWheelView(context),
    );
  }

  // неверно
  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemExtent: itemExtent,
      itemCount: items.length,
      itemBuilder: (context, index) => _buildItem(context, index),
    );
  }

  Widget _buildListWheelView(BuildContext context) {
    return ListWheelScrollView(
      controller: controller,
      itemExtent: itemExtent,
      squeeze: 1,
      children: items.map((index) => _buildItem(context, index)).toList(),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Card(
      key: ValueKey(index),
      child: Container(
        child: ListTile(
          onTap: () {},
          title: Text('$index'),
          trailing: IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                items.remove(index);
              });
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('FixedExtentScrollController'),
      centerTitle: true,
    );
  }
}
