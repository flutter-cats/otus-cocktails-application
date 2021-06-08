import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'material/1_dialogs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // используется только для примеров с /app
      //theme: mainThemeData,
      locale: Locale('ru'),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      home: MaterialDialogsSample(),
      //home: CocktailsFilterScreen(AsyncCocktailRepository()),
      //home: CupertinoContextMenuSample(),
    );
  }
}
