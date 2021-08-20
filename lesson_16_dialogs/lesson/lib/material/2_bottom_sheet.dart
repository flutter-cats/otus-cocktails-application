import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson/content.dart';

class BottomSheetSamplePage extends StatefulWidget {
  @override
  _BottomSheetSamplePageState createState() => _BottomSheetSamplePageState();
}

class _BottomSheetSamplePageState extends State<BottomSheetSamplePage>
    with TickerProviderStateMixin {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Material Dialogs'),
      ),
      body: Builder(
        builder: (context) => ListView(
          children: [
            TextButton(
                onPressed: () => _showModalBottomDialog(),
                child: Text('Show modal BottomSheet')),
            TextButton(
                onPressed: () => _showModalBottomDialog2(),
                child: Text('Show modal scrollControlled BottomSheet')),
            TextButton(
                onPressed: () => _showPersistentBottomDialog(context),
                child: Text('Show simple persistent BottomSheet')),
            TextButton(
                onPressed: () => _showPersistentBottomDialog2(context),
                child: Text('Show persistent BottomSheet'))
          ],
        ),
      ),
    );
  }

  // Простой пример модального окна
  Future _showModalBottomDialog() {
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop('result');
            },
            child: Text(
              'Title',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Text('Content'),
          // для примера isScrollControlled
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (c, i) => ListTile(
                title: Text(
                  'Title',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Пример реализации окна с прокручиваемым контентом
  // с использованием DraggableScrollableSheet
  Future _showModalBottomDialog2() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
          maxChildSize: 0.6,
          minChildSize: 0.3,
          builder: (context, controller) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop('result');
                    },
                    child: Text(
                      'Title',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text('Content'),
                  // для примера isScrollControlled
                  Expanded(
                    child: ListView.builder(
                      controller: controller,
                      itemCount: 10,
                      itemBuilder: (c, i) => ListTile(
                        title: Text(
                          'Title',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Future _showPersistentBottomDialog(BuildContext scaffoldContext) async {
    showBottomSheet(
      context: scaffoldContext,
      builder: (context) => Container(
        width: double.maxFinite,
        color: Colors.blue[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Title',
              style: Theme.of(context).textTheme.headline6,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.white,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close')),
          ],
        ),
      ),
    );
    // final result = await controller.closed;
    // print('result:$result');
  }

  Future _showPersistentBottomDialog2(BuildContext scaffoldContext) async {
    final controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        vsync: this,
        reverseDuration: Duration(seconds: 1),
        duration: Duration(seconds: 1));
    showBottomSheet(
      context: scaffoldContext,
      transitionAnimationController: controller,
      builder: (context) => BottomSheet(
        backgroundColor: Colors.blue[100],
        elevation: 8.0,
        animationController: controller,
        onClosing: () {
          print('onClosing');
        },
        onDragEnd: (DragEndDetails details, {required bool isClosing}) {
          print('onDragEnd');
        },
        onDragStart: (DragStartDetails details) {
          print('onDragStart');
        },
        builder: (context) {
          return Container(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.white,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close')),
              ],
            ),
          );
        },
      ),
    );
    // final result = await controller.closed;
    // print('result:$result');
  }
}
