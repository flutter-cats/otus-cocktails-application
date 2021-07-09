import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PositionedScrollSample extends StatefulWidget {
  const PositionedScrollSample({Key? key}) : super(key: key);

  @override
  _PositionedScrollSampleState createState() => _PositionedScrollSampleState();
}

class _PositionedScrollSampleState extends State<PositionedScrollSample> {
  final itemScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PositionedScrollSample'),
      ),
      persistentFooterButtons: [
        TextButton(
            onPressed: () {
              final current =
                  itemPositionsListener.itemPositions.value.first.index;
              itemScrollController.scrollTo(
                index: current + 1,
                duration: Duration(seconds: 1),
              );
            },
            child: Text('Next')),
        TextButton(
          onPressed: () {
            itemScrollController.scrollTo(
              index: 10,
              duration: Duration(seconds: 1),
            );
          },
          child: Text('to 10'),
        )
      ],
      body: ScrollablePositionedList.builder(
        itemCount: 500,
        itemBuilder: (context, index) => ListTile(
          title: Text('Item $index'),
        ),
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
      ),
    );
  }
}
