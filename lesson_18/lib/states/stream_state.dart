import 'package:lesson_18/states/state.dart';

class StreamState extends State {
  @override
  List<String> content = [];

  Stream<StreamState> get streamContent => Stream.periodic(const Duration(seconds: 1), (int count) {
        final StreamState state = StreamState()..addContent();
        state.content = state.content.map((String title) => '$title | $count').toList();
        return state;
      });

  @override
  void addContent() {
    content.clear();
    content.addAll(generateCocktails());
    print('Simple State content length = ${content.length}');
  }
}
