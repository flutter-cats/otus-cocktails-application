import 'package:cocktail_app/core/src/model/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class CocktailShareButton extends StatelessWidget {
  final Cocktail cocktail;

  CocktailShareButton({required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ///    - Склонировать соотвествующий github репозиторий с заготовкой проекта для этого урока (https://github.com/guid-empty/otus-cocktail-app-lessons)
          ///    - Подключить соот-щий плагинг для вызова platform's share dialog в pubspec.yaml
          ///    - Открыть класс экрана CocktailDetailPage -> виджет CocktailPreview с кнопкой Share
          ///    - Внести изменения в код обработчика событий на нажатие кнопки Share (Поделиться) (в виджете CocktailPreview)
          ///    - В обработчике события на Sharing сформировать текст с ссылкой на ImageThumb для описания коктейля
          ///    - В обработчике события на Sharing выполнить обращение к классу плагина и пошарить описание коктейля
          ///    - Убедиться, что сформированный текст уходит в канал #random в нашем канале Slack
          ///
          /// На усмотрение студента:
          ///    - Можно использовать любые проверенные плагины из pub.dev
          ///    - Можно выполнить любую декомпозицию методов экрана CocktailDetailPage (а также в виджете CocktailPreview) или кнопки Share для внесения изменений, требуемых для sharing

          Share.share("Cocktail: ${cocktail.name}\n" +
              "URL: ${cocktail.drinkThumbUrl}\n" +
              "Category: ${cocktail.category.value}\n" +
              "GlassType: ${cocktail.glassType.value}\n" +
              "Ingredients: ${cocktail.ingredients.map((e) => "${e.ingredientName} - ${e.measure}").join(", ")}\n" +
              "Instruction: ${cocktail.instruction}\n");
        },
        icon: Icon(
          Icons.share,
          color: Colors.white,
        ));
  }
}
