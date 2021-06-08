import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:lesson_18/states/state.dart';

class ChangeNotifierState extends State with ChangeNotifier {
  @override
  List<String> content = [];

  @override
  void addContent() {
    content.clear();
    content.addAll(generateCocktails());
    notifyListeners();
    print('Change Notifier State content length = ${content.length}');
  }
}
