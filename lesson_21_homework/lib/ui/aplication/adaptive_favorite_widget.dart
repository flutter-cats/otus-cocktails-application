import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lesson_21_animations_homework/core/src/model/cocktail_definition.dart';
import 'package:lesson_21_animations_homework/state/favorites_store.dart';
import 'package:provider/provider.dart';

class AdaptiveFavoriteWidget extends StatefulWidget {
  final Color color;
  final Color backgroundColor;
  final CocktailDefinition? cocktailDefinition;

  AdaptiveFavoriteWidget({
    Key? key,
    this.cocktailDefinition,
    this.color = Colors.white,
    this.backgroundColor = Colors.grey,
  }) : super(key: key);

  @override
  _AdaptiveFavoriteWidgetState createState() => _AdaptiveFavoriteWidgetState();
}

class _AdaptiveFavoriteWidgetState extends State<AdaptiveFavoriteWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;

  void _handleAnimationStatusChange(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reset();
    }
  }

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    controller.addListener(() {
      setState(() {});
    });
    controller.addStatusListener(_handleAnimationStatusChange);

    sizeAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 80.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 80.0, end: 0.0), weight: 1),
      ],
    ).animate(controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final favoritesStore = Provider.of<FavoritesStore>(context);

        return InkWell(
          child: Container(
            padding: EdgeInsets.all(20),
            child: CustomPaint(
              painter: FavoriteWidgetPainter(
                scale: sizeAnimation.value,
                isFavorite: favoritesStore.isFavorite(widget.cocktailDefinition!.id!),
                color: widget.color,
                backgroundColor: widget.backgroundColor,
              ),
            ),
          ),
          onTap: () {
            if (favoritesStore.isFavorite(widget.cocktailDefinition!.id!)) {
              favoritesStore
                  .removeFromFavorites(widget.cocktailDefinition!.id!);
            }
            else {
              favoritesStore.addToFavorites(widget.cocktailDefinition!);
            }
            controller.forward();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class FavoriteWidgetPainter extends CustomPainter {
  final Color color;
  final Color backgroundColor;
  final bool isFavorite;
  final double scale;

  const FavoriteWidgetPainter({
    required this.scale,
    required this.isFavorite,
    required this.color,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintHeart = Paint()
      ..color = color
      ..style = isFavorite ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 2;

    var sc = scale / 100.0 + 1;
    final path = Path()
      ..moveTo(0, -6 * sc)
      ..cubicTo(0, -6 * sc, 8 * sc, -18 * sc, 12 * sc, -3 * sc)
      ..cubicTo(12 * sc, -3 * sc, 12 * sc, 4 * sc, 0, 10 * sc)
      ..moveTo(0, -6 * sc)
      ..cubicTo(0, -6 * sc, -8 * sc, -18 * sc, -12 * sc, -3 * sc)
      ..cubicTo(-12 * sc, -3 * sc, -12 * sc, 4 * sc, 0, 10 * sc);

    canvas.drawPath(path, paintHeart);

    if (scale != 0) {
      final paintCircle = Paint()
        ..color = backgroundColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5;
      canvas.drawCircle(Offset(0, 0), scale / 3, paintCircle);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
