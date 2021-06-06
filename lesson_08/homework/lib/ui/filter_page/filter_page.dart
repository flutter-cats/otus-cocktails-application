import 'package:cocktail/core/src/model/cocktail_category.dart';
import 'package:cocktail/res/application_colors.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final _searchStringController = TextEditingController();
  CocktailCategory _selectedCocktailCategory = CocktailCategory.values.first;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          _searchString(size),
          _cocktailCategoryChips(),
        ],
      )),
    );
  }

  Widget _searchString(Size size) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: size.width * 0.95,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(65),
            ),
            child: Stack(alignment: const Alignment(1.0, 1.0), children: [
              TextField(
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(color: Colors.white),
                controller: _searchStringController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                textInputAction: TextInputAction.search,
                onChanged: (text) {
                  setState(() {});
                },
              ),
              _searchStringController.text.length > 0
                  ? IconButton(
                      onPressed: () {
                        _searchStringController.clear();
                      },
                      icon: Icon(Icons.close, color: Colors.grey))
                  : SizedBox()
            ])));
  }

  Widget _cocktailCategoryChips() {
    List<Widget> chips = CocktailCategory.values
        .map((e) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ChoiceChip(
                label: Text(
                  e.value.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                labelPadding: EdgeInsets.all(5),
                selected: _selectedCocktailCategory == e,
                backgroundColor: ApplicationColors.instructionBackground,
                selectedColor: ApplicationColors.selectedBackgroundColor,
                //shape: ,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedCocktailCategory = e;
                  });
                },
              ),
            ))
        .toList();

    return Container(
        height: 50,
        child: ListView(scrollDirection: Axis.horizontal, children: chips));
  }
}
