import 'package:flutter/material.dart';

final materialSampleThemeData = ThemeData(
  appBarTheme: AppBarTheme(color: Colors.red),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: Colors.blue),
  accentColor: Colors.red,
  primaryColor: Colors.blue,
  buttonTheme: ButtonThemeData(buttonColor: Colors.green),
);

class MaterialSamplePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppBarTitle')),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('headline6', style: Theme.of(context).textTheme.headline6),
              Text('subtitle1', style: Theme.of(context).textTheme.subtitle1),
              Text('bodyText1', style: Theme.of(context).textTheme.bodyText1),
              Text('caption', style: Theme.of(context).textTheme.caption),
              Text('overline', style: Theme.of(context).textTheme.overline),
              TextButton(
                  child: Text('TextButton'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('TextButton tapped')));
                  }),
              ElevatedButton(child: Text('ElevatedButton'), onPressed: () {}),
              OutlinedButton(child: Text('OutlinedButton'), onPressed: () {}),
            ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
