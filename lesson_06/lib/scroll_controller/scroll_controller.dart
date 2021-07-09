import 'package:flutter/material.dart';

class ScrollControllerSamplePage extends StatefulWidget {
  @override
  _ScrollControllerSamplePageState createState() =>
      _ScrollControllerSamplePageState();
}

class _ScrollControllerSamplePageState
    extends State<ScrollControllerSamplePage> {
  static const _duration = Duration(milliseconds: 500);

  static const _curve = Curves.linear;

  final controller = ScrollController(initialScrollOffset: 1000);

  final items = List.generate(100, (index) => index);

  final itemExtent = 75.0;

  @override
  void initState() {
    controller.addListener(() {
      // print(controller.offset);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildListView(),
    );
  }

  // ScrollPhysics
  Widget _buildListView() {
    final physics = ClampingScrollPhysics();
    //final physics = BouncingScrollPhysics();
    //final physics = NeverScrollableScrollPhysics();
    return ListView.builder(
      controller: controller,
      physics: physics,
      itemCount: items.length,
      itemBuilder: (context, index) => _buildItem(context, index),
    );
  }

  //NotificationListener
  Widget _buildWithNotificationListener() {
    return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            print('Scrolling has started');
          } else if (scrollNotification is ScrollEndNotification) {
            print("Scrolling has ended");
          } else if (scrollNotification is ScrollUpdateNotification) {
            //print('scrollNotification:$scrollNotification');
          } else if (scrollNotification is UserScrollNotification) {
            //print('UserScrollNotification:$scrollNotification');
          }
          // Return true to cancel the notification bubbling.
          return true;
        },
        child: _buildListView());
  }

  Widget _buildItem(BuildContext context, int index) {
    return Card(
      key: ValueKey(index),
      child: Container(
        // height: itemExtent + index,
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
      title: Text('ScrollControllerSamplePage'),
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: Row(
          children: [
            FlatButton(
              onPressed: () {
                print('${controller.position.maxScrollExtent}');
                final currentOffset = controller.offset;
                controller.animateTo(currentOffset + itemExtent,
                    duration: _duration, curve: _curve);
              },
              child: Text('show'),
            ),
            FlatButton(
              onPressed: () {
                controller.animateTo(0, curve: _curve, duration: _duration);
              },
              child: Text('animate up'),
            ),
            FlatButton(
              onPressed: () {
                controller.jumpTo(controller.position.maxScrollExtent);
                //print('${controller.position.maxScrollExtent}');
              },
              child: Text('jump down'),
            )
          ],
        ),
      ),
    );
  }
}
