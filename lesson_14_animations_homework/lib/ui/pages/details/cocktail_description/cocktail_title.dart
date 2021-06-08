import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CocktailTitle extends StatelessWidget {
  final String cocktailTitle;
  final bool isFavorite;

  CocktailTitle({
    required this.cocktailTitle,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cocktailTitle,
            style: Theme.of(context).textTheme.headline3,
          ),
          _getIsFavoriteIcon()
        ],
      );

  ///
  /// todo:
  /// отрефакторить данный метод в пользу отдельного widget с поддержкой
  /// анимации scale down/scale up на 20% (curves по желанию)
  ///
  /// Новый виджет должен поддерживать два состояния -
  /// isFavorite, !isFavorite (иконка filled, outline).
  /// Иконка должна быть отрисована с использованием графических примитивов -
  /// то есть использовать material icons нельзя,
  /// работаем через CustomPaint/ClipPath.
  /// При нажатии иконка должна увеличиваться на 20 % и
  /// возвращаться в исходное состояние.
  /// Можно добавить свою физику за счет Curves (ease, elastic, bounce).
  ///
  Widget _getIsFavoriteIcon() => isFavorite
      ? IconButton(
          icon: Icon(Icons.favorite, color: Colors.white),
          onPressed: () {},
        )
      : IconButton(
          icon: Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {},
        );
}
