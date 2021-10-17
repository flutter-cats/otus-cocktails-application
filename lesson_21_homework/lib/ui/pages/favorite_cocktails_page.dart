import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:lesson_21_animations_homework/core/data/HiveBoxes.dart';
import 'package:lesson_21_animations_homework/core/src/dto/cocktail_definition_dto.dart';
import 'package:lesson_21_animations_homework/core/src/repository/FavouriteCocktailsStore.dart';
import 'package:lesson_21_animations_homework/ui/aplication/application_scaffold.dart';
import 'package:lesson_21_animations_homework/core/models.dart';
import 'package:flutter/material.dart';
import 'package:lesson_21_animations_homework/ui/pages/cocktail_grid_item.dart';
import 'package:provider/provider.dart';

///
///        - Склонировать соотвествующий github репозиторий с заготовкой проекта для этого урока (для соот-щего подхода к управлению состоянием приложения - redux, bloc mobx версии) (https://github.com/guid-empty/otus-cocktail-app-lessons)
///        - Открыть класс экрана FavouriteCocktailsPage
///        - Внести изменения в код экрана, выделив логику для получения состояния используя один из ранее рассмотренных подходов к state management
///        - Внести изменения в экран CocktailDetailPage (CocktailTitle) для управления состояния isFavourite текущей модели (коктейль должен появиться или удалиться в списке избранного в соот-щем блоке состояния приложения)
///        - Убедиться, что изменения состояния isFavourite для конкретного коктейля отражается в поведении экрана FavouriteCocktailsPage (появляется новый избранный коктейль, удаляется ранее убранный из favourites)
///
/// На усмотрение студента:
///        - Можно выполнить любую декомпозицию класса FavouriteCocktailsPage для внесения изменений в управление состоянием (рефакторинг)
///        - Можно выполнить любую декомпозицию класса CocktailDetailPage (CocktailTitle) для внесения изменений в управление состоянием (рефакторинг)
///        - Можно выполнить любую декомпозицию в самих классах управления состоянием приложения (store, block etc)
///        - Можно выполнить рефакторинг кнопки isFavourite, выделив ее в отдельный виджет и используя на обоих экранах
/// Мокап экрана Избранное (FavouriteCocktailsPage):
/// https://www.figma.com/file/UKHKopXpDy02I232c9mdwZ/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8?node-id=24%3A441
///
/// В этом экране используется точно такая же  верстка, как и на экране фильтрации (то есть можно переиспользовать экран выдачи результатов по категориям)
///
class FavouriteCocktailsPage extends StatefulWidget {
  @override
  _FavouriteCocktailsPageState createState() => _FavouriteCocktailsPageState();
}

class _FavouriteCocktailsPageState extends State<FavouriteCocktailsPage> {
  @override
  Widget build(BuildContext context) {
    return ApplicationScaffold(
      title: 'Избранное',
      currentSelectedNavBarItem: 2,
      child: _buildFavoriteCocktailItems(context),
    );
  }

  Widget _buildFavoriteCocktailItems(BuildContext context) {
    final box = Hive.box<CocktailDefinition>(HiveBoxes.favouriteCocktails);
    var list = <CocktailDefinition?>[];
    final l = box.length;
    for (int i = 0; i < l; i++) {
      list.add(box.getAt(i));
    }
    print(list.map((e) => e?.name));
    return Observer(builder: (context) {
      final favoriteCocktailsStore =
          Provider.of<FavouriteCocktailsStore>(context);
      final favorites = favoriteCocktailsStore.favouriteCocktails;

      if (favorites.isNotEmpty) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: CocktailGridItem.aspectRatio,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => CocktailGridItem(favorites[index],
              selectedCategory: CocktailCategory.ordinaryDrink),
          //here is mock for category. why is it in this widget. it's part of cocktail details
          padding: const EdgeInsets.all(8.0),
          itemCount: favorites.length,
        );
      } else {
        return Center(
          child: Text(
            'Тут пока ничего нет :(',
            style: TextStyle(color: Colors.white),
          ),
        );
      }
    });
  }
}
