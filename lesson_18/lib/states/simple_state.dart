import 'package:lesson_18/states/state.dart';

class SimpleState extends State {
  @override
  List<String> content = [];

  @override
  void addContent() {
    content.clear();
    content.addAll(generateCocktails());
    print('Simple State content length = ${content.length}');
  }
}
