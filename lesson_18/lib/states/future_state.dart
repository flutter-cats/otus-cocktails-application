import 'package:lesson_18/states/state.dart';

class FutureState extends State {
  @override
  List<String> content = [];

  Future<FutureState> get futureContent => Future<FutureState>.delayed(
        const Duration(seconds: 5),
        () {
          print('Future content value ready');
          final state = FutureState()..addContent();
          return state;
        },
      );

  @override
  void addContent() {
    content.clear();
    content.addAll(generateCocktails());
    print('Future State content length = ${content.length}');
  }
}
