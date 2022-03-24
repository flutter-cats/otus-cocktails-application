import 'package:flutter/material.dart';

class CocktailFilterWrapper extends StatefulWidget {
  const CocktailFilterWrapper(
      {Key? key, required this.child, required this.selectedCocktailCategory})
      : super(key: key);

  final int selectedCocktailCategory;
  final Widget child;

  @override
  _CocktailFilterWrapperState createState() => _CocktailFilterWrapperState();
}

class _CocktailFilterWrapperState extends State<CocktailFilterWrapper> {
  late int selectedCocktailCategory;

  void setCocktailCategory(int newSelectedCocktailType) {
    setState(() {
      selectedCocktailCategory = newSelectedCocktailType;
    });
  }

  @override
  void initState() {
    selectedCocktailCategory = widget.selectedCocktailCategory;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => StateInheritedWidget(
        child: widget.child,
        selectedCocktailCategory: selectedCocktailCategory,
        stateWidget: this,
      );
}

class StateInheritedWidget extends InheritedWidget {
  const StateInheritedWidget({
    required this.selectedCocktailCategory,
    Key? key,
    required Widget child,
    required this.stateWidget,
  }) : super(key: key, child: child);

  final int? selectedCocktailCategory;
  final _CocktailFilterWrapperState stateWidget;

  static _CocktailFilterWrapperState of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()
        ?.stateWidget;
    assert(result != null, 'No StateInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) {
    return selectedCocktailCategory != oldWidget.selectedCocktailCategory;
  }
}
