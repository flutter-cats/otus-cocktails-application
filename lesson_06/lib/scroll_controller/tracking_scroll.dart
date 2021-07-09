import 'package:flutter/material.dart';

class TrackingScrollSamplePage extends StatefulWidget {
  @override
  _TrackingScrollSamplePageState createState() =>
      _TrackingScrollSamplePageState();
}

class _TrackingScrollSamplePageState extends State<TrackingScrollSamplePage> {
  final _trackingScrollController = ScrollController();
  // final _trackingScrollController = TrackingScrollController();

  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(child: _buildPage(page)),
    );
  }

  Widget _buildPage(int index) {
    return ListView(
      key: UniqueKey(),
      controller: _trackingScrollController,
      children: List<Widget>.generate(
          100,
          (int i) => Card(
                  child: Text(
                'page $index item $i',
              ))).toList(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('TrackingScrollController'),
      actions: [
        IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              setState(() {
                page++;
              });
            })
      ],
    );
  }
}
