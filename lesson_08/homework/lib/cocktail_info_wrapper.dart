import 'package:flutter/material.dart';

class CocktailInfoWrapper extends StatefulWidget {
  const CocktailInfoWrapper(
      {Key? key,
      required this.child,
      required this.isFavourite,
      required this.rating})
      : super(key: key);

  final bool? isFavourite;
  final int rating;
  final Widget child;

  @override
  _CocktailInfoWrapperState createState() => _CocktailInfoWrapperState();
}

class _CocktailInfoWrapperState extends State<CocktailInfoWrapper> {
  late int rating;
  late bool? isFavourite;

  void setRating(int newRating) {
    setState(() {
      rating = newRating;
    });
  }

  void setFavourite(bool newFavourite) {
    setState(() {
      isFavourite = newFavourite;
    });
  }

  @override
  void initState() {
    rating = widget.rating;
    isFavourite = widget.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => StateInheritedWidget(
        child: widget.child,
        rating: rating,
        stateWidget: this,
        isFavourite: isFavourite,
      );
}

class StateInheritedWidget extends InheritedWidget {
  const StateInheritedWidget({
    required this.isFavourite,
    required this.rating,
    Key? key,
    required Widget child,
    required this.stateWidget,
  }) : super(key: key, child: child);

  final int? rating;
  final bool? isFavourite;
  final _CocktailInfoWrapperState stateWidget;

  static _CocktailInfoWrapperState of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()
        ?.stateWidget;
    assert(result != null, 'No StateInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) {
    return rating != oldWidget.rating || isFavourite != oldWidget.isFavourite;
  }
}
