abstract class State {
  List<String> get content;
  void addContent();

  List<String> generateCocktails() {
    final List<String> titles = [];
    for (int i = 0; i < 20; i++) {
      titles.add('Cocktail - ${i + 1}');
    }
    return titles;
  }
}
