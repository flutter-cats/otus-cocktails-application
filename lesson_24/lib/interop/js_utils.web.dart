@JS()
library js_utils;

import 'package:js/js.dart';

@JS('log')
external void logToConsole(String text);

@JS('disableSaveShortcut')
external void disableSaveShortcut();