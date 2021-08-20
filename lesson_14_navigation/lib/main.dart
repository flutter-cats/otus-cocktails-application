import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/src/repository/async_cocktail_repository.dart';
import 'hero/cocktails/filter_page.dart';
import 'hero/coctail_detail_page.dart';
import 'navigator/1_navigator_api_unnamed_routes.dart';
import 'navigator/2_navigator_api_pop.dart';
import 'navigator/3_navigator_api_generated_routes.dart';
import 'navigator/4_navigator_api_named_routes.dart';
import 'navigator/5_navigator_api_sending_data_1.dart';
import 'navigator/local_history_entry.dart';
import 'navigator/navigator_result_1.dart';
import 'navigator/navigator_result_2.dart';
import 'navigator/navigator_result_3.dart';
import 'navigator/nested_navigation.dart';
import 'navigator/observers.dart';
import 'navigator/routes/cupertino_route_sample.dart';
import 'navigator/routes/custom_route_sample.dart';
import 'navigator/routes/material_route_sample.dart';
import 'overlay/overlay_state_page.dart';
import 'overlay/overlay_state_star_animation.dart';

void main() {
  //runApp(LocalHistoryApp());
  //runApp(_buildApp());
  runApp(_buildApp(NavigatorApiGetResult1()));
}

Widget _buildApp(Widget screen) {
  return MaterialApp(
    home: screen,
  );
}

//for hero sample
// Widget _buildApp() {
//   return MaterialApp(
//     themeMode: ThemeMode.dark,
//     theme: ThemeData(
//         scaffoldBackgroundColor: Colors.black,
//         accentColor: Colors.white,
//         textTheme: TextTheme(
//             bodyText1: TextStyle(color: Colors.white),
//             bodyText2: TextStyle(color: Colors.white),
//             caption: TextStyle(color: Colors.white))),
//     home: CocktailsFilterScreen(AsyncCocktailRepository()),
//   );
// }
