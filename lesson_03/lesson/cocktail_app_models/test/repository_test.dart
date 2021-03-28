import 'package:cocktail_app_models/src/repository/sync_cocktail_repository.dart';
import 'package:test/test.dart';

void main() {
  late SyncCocktailRepository syncRepository;

  setUp(() {
    syncRepository = SyncCocktailRepository();
  });

  group('Cocktail repository', () {
    test('fetchAllCocktails method should return all cocktails', () {
      final actualResult = syncRepository.fetchAllCocktails();
      expect(actualResult, isNotEmpty);

      final actualResult1 = syncRepository.fetchAllCocktails();
      expect(actualResult1, isNotEmpty);

    });

    test('fetchPopularCocktails method should return 20 popular cocktails', () {
      final actualResult = syncRepository.fetchPopularCocktails();
      expect(actualResult, isNotEmpty);
      expect(actualResult.length, 20);
    });
  });
}
