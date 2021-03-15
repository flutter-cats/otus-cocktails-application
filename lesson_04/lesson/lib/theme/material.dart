import 'package:flutter/material.dart';

class MaterialSamplePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('AppBarTitle')),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('headline6', style: textTheme.headline6),
              Text('subtitle1', style: textTheme.subtitle1),
              Text('bodyText1', style: textTheme.bodyText1),
              Text('caption', style: textTheme.caption),
              Text('overline', style: textTheme.overline),
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

ThemeData get materialSampleThemeData => ThemeData(
    appBarTheme: AppBarTheme(color: Colors.green),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.blue),
    accentColor: Colors.red,
    primaryColor: Colors.blue,
    buttonTheme: ButtonThemeData(buttonColor: Colors.green));
