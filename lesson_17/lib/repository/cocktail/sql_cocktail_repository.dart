import 'dart:convert';

import 'package:lesson_17/model/cocktail/cocktail.dart';
import 'package:lesson_17/model/cocktail/ingredient_definition.dart';
import 'package:lesson_17/repository/entity/sql_repository.dart';
import 'package:sqflite_common/sqlite_api.dart';

const String COCKTAIL = 'Cocktail';
const String COCKTAIL_KEY = 'CocktailKey';
const String CATEGORY = 'Category';
const String GLASS_TYPE = 'GlassType';
const String COCKTAIL_TYPE = 'CocktailType';
const String INGREDIENT = 'Ingredient';
const String SETTINGS = 'Settings';

class SqlCocktailRepository extends SqlRepository<Cocktail> {
  Future<void> _printTable(Database db, String name) async {
    final List<Map<String, Object?>> result = await db.query(name);
    final String encodedJson = jsonEncode(result);
    print(encodedJson);
  }

  @override
  int get version => 1;

  @override
  Future<void> onCreate(Database db, int version) async {
    final List<String> commands = [
      'CREATE TABLE $CATEGORY (id TEXT PRIMARY KEY, value TEXT NOT NULL, name TEXT NOT NULL)',
      'CREATE TABLE $GLASS_TYPE (id TEXT PRIMARY KEY, value TEXT NOT NULL, name TEXT NOT NULL)',
      'CREATE TABLE $COCKTAIL_TYPE (id TEXT PRIMARY KEY, value TEXT NOT NULL, name TEXT NOT NULL)',
      '''
      CREATE TABLE $COCKTAIL (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        instruction TEXT NOT NULL,
        categoryId TEXT NOT NULL,
        glassTypeId TEXT NOT NULL,
        cocktailTypeId TEXT NOT NULL,
        thumbUrl TEXT NOT NULL,
        isFavourite INTEGER NOT NULL,
        FOREIGN KEY (categoryId) REFERENCES $CATEGORY (id),
        FOREIGN KEY (glassTypeId) REFERENCES $GLASS_TYPE (id),
        FOREIGN KEY (cocktailTypeId) REFERENCES $COCKTAIL_TYPE (id)
      )
      ''',
      'CREATE TABLE $INGREDIENT (id TEXT PRIMARY KEY, ingredientName TEXT NOT NULL, measure TEXT NOT NULL, cocktailId TEXT NOT NULL, FOREIGN KEY (cocktailId) REFERENCES $COCKTAIL (id))',
      'CREATE TABLE $SETTINGS (tabIndex INTEGER)',
      'CREATE TABLE $COCKTAIL_KEY (key TEXT PRIMARY KEY, cocktailId TEXT, FOREIGN KEY (cocktailId) REFERENCES $COCKTAIL (id))'
    ];
    final Batch batch = db.batch();
    commands.forEach((String command) => db.execute(command));
    await batch.commit();
    await _printTable(db, 'sqlite_master');
    await _printTable(db, COCKTAIL);
  }

  @override
  Future<List<Cocktail>> readAll() async {
    final List<Map<String, dynamic>> entities = await db.rawQuery('''
      SELECT * FROM $COCKTAIL
''');
    return const [];
  }

  @override
  Future<Cocktail?> readById(String id) async {
    final List<Map<String, Object?>> response = await db.rawQuery('''
      SELECT * FROM $COCKTAIL as c
      WHERE c.id = "${id}"
    ''');
    print('For debug');
    // TODO: implement readByKey
    throw UnimplementedError();
  }

  @override
  Future<Cocktail?> readByKey(String key) {
    // TODO: implement readByKey
    throw UnimplementedError();
  }

  @override
  Future<List<Cocktail>> replaceAll(List<Cocktail> entities) {
    // TODO: implement replaceAll
    throw UnimplementedError();
  }

  @override
  Future<Cocktail> save(Cocktail entity) async {
    await db.transaction((Transaction transaction) async {
      /*
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        instruction TEXT NOT NULL,
        categoryId TEXT NOT NULL,
        glassTypeId TEXT NOT NULL,
        cocktailTypeId TEXT NOT NULL,
        thumbUrl TEXT NOT NULL,
        isFavourite INTEGER NOT NULL,
       */
      await transaction.rawInsert('''
        INSERT INTO $COCKTAIL (id, name, instruction, categoryId, glassTypeId, cocktailTypeId, thumbUrl, isFavourite)
        VALUES ("${entity.id}", "${entity.name}", "${entity.instruction}", "${entity.category.id}", "${entity.glassType.id}", "${entity.cocktailType.id}", "${entity.drinkThumbUrl}", ${entity.isFavourite ? 1 : 0})
      ''');
      /*
        id TEXT PRIMARY KEY,
        value TEXT NOT NULL,
        name TEXT NOT NULL
       */
      await transaction.insert(CATEGORY, {
        'id': entity.category.id,
        'value': entity.category.value,
        'name': entity.category.name,
      });
      /*
        id TEXT PRIMARY KEY,
        value TEXT NOT NULL,
        name TEXT NOT NULL
       */
      await transaction.insert(GLASS_TYPE, entity.glassType.toJson());
      /*
        id TEXT PRIMARY KEY,
        ingredientName TEXT NOT NULL,
        measure TEXT NOT NULL,
        cocktailId TEXT NOT NULL,
       */
      await transaction.insert(COCKTAIL_TYPE, entity.cocktailType.toJson());
      for (final IngredientDefinition ingredient in entity.ingredients) {
        await transaction.insert(INGREDIENT, {
          'id': ingredient.id,
          'ingredientName': ingredient.ingredientName,
          'measure': ingredient.measure,
          'cocktailId': entity.id,
        });
      }
    });
    return entity;
  }

  @override
  Future<Cocktail> saveByKey(String key, Cocktail entity) {
    // TODO: implement saveByKey
    throw UnimplementedError();
  }

  @override
  Future<List<Cocktail>> saveMany(List<Cocktail> entities) {
    // TODO: implement saveMany
    throw UnimplementedError();
  }
}
