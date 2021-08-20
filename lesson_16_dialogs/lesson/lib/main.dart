import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import ' bonus_navigator_api_2/3_example.dart';
import ' bonus_navigator_api_2/2_example.dart';
import ' bonus_navigator_api_2/1_example.dart';
import 'app/cocktails/filter_page.dart';
import 'app/core/src/repository/async_cocktail_repository.dart';
import 'app/style/theme.dart';
import 'cupertino/cupertino_context_menu.dart';
import 'cupertino/cupertino_popups.dart';
import 'custom/sample_1.dart';
import 'custom/sample_2.dart';
import 'material/1_dialogs.dart';
import 'material/2_bottom_sheet.dart';
import 'material/3_pickers.dart';
import 'material/4_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // используется только для примеров с /app
     // theme: mainThemeData,
      locale: Locale('ru'),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      home: MaterialDialogsSample(),
      // home: BottomSheetSamplePage(),
      //home: PickersSample(),
      //home: ScaffoldPopups(),
      //home: CupertinoPopups(),
      // home: CupertinoContextMenuSample(),
      //home: CustomDialogSample1(),
      // home: CustomDialogSample2(),
      // home: Navigator3Example(),
      // Пример Hero навигации в диалоговых окнах
      // home: CocktailsFilterScreen(AsyncCocktailRepository()),
    );
  }
}
