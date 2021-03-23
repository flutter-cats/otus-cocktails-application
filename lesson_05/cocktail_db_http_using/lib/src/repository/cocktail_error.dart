class CocktailException implements Exception {
  String? message;

  CocktailException(String message) {
    this.message = message;
  }
}