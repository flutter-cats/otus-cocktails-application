import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetSamplePage extends StatefulWidget {
  @override
  _BottomSheetSamplePageState createState() => _BottomSheetSamplePageState();
}

class _BottomSheetSamplePageState extends State<BottomSheetSamplePage> {
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
                onPressed: () => _showPersistentBottomDialog(context),
                child: Text('Show persistent BottomSheet'))
          ],
        ),
      ),
    );
  }

  // Открывает модально
  void _showModalBottomDialog() async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        isDismissible: false,
        enableDrag: true,
        shape: RoundedRectangleBorder(
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
            ));
  }

  void _showPersistentBottomDialog(BuildContext scaffoldContext) async {
    final result = await showBottomSheet(
      context: scaffoldContext,
      builder: (context) => Container(
        color: Colors.blue[100],
        padding: const EdgeInsets.all(16),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Title',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Content',
              style: TextStyle(color: Colors.grey),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close')),
            // Expanded(
            //     child: ListView.builder(
            //         itemCount: 10,
            //         itemBuilder: (c, i) => ListTile(
            //               title: Text(
            //                 'Title',
            //                 style: Theme.of(context).textTheme.bodyText1,
            //               ),
            //             )))
          ],
        ),
      ),
    ).closed;
  }
}
