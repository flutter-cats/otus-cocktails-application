import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:lesson_21_animations_homework/core/src/model/cocktail_definition.dart';
import 'package:lesson_21_animations_homework/ui/aplication/adaptive_favorite_widget.dart';

///
/// TODO:
///        - Склонировать соотвествующий github репозиторий с заготовкой проекта для этого урока (для соот-щего подхода к управлению состоянием приложения - redux, bloc mobx версии) (https://github.com/guid-empty/otus-cocktail-app-lessons)
///        - Внести изменения в классы описания состояний для экрана FavouriteCocktailsPage (будут помечены /// todo)
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
class CocktailTitle extends StatelessWidget {
  final CocktailDefinition cocktailDefinition;

  CocktailTitle({required this.cocktailDefinition});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) {
          return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cocktailDefinition.name!,
          style: Theme.of(context).textTheme.headline3,
        ),
        _getIsFavoriteIcon()
      ],
    ); });
  }

  Widget _getIsFavoriteIcon() {
    return AdaptiveFavoriteWidget(
      color: Colors.white,
      backgroundColor: Colors.grey,
      cocktailDefinition: cocktailDefinition,
    );
  }
}
