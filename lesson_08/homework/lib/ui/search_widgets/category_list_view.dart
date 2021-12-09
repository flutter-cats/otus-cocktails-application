import 'package:cocktail/core/models.dart';
import 'package:cocktail/core/src/globals.dart';
import 'package:cocktail/ui/search_widgets/res/consts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final refreshListOfCategoies = GlobalKey();

class CategoryListView extends StatefulWidget {
  const CategoryListView({Key? key}) : super(key: key);
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  final catgories = CocktailCategory.values;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...listOfItems(catgories),
        ],
      ),
    );
  }
}

class ListViewCategoryItem extends StatefulWidget {
  final String catValue;
  final String catName;
  bool isActive = false;
  ListViewCategoryItem(this.catValue, this.catName, this.isActive, {Key? key})
      : super(key: key);

  @override
  State<ListViewCategoryItem> createState() => _ListViewCategoryItemState();
}

class _ListViewCategoryItemState extends State<ListViewCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isActive = !widget.isActive;
          if (widget.isActive)
            Globals.chosenCategories.add(widget.catName);
          else
            Globals.chosenCategories.remove(widget.catName);
          print("Tap on kontainer ${widget.catName} \n Выбраны категории:");
          Globals.chosenCategories.forEach((element) {
            print(element);
          });
        });
      },
      child: Container(
        margin: EdgeInsets.all(6),
        height: 46,
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: widget.isActive
              ? activeCategoryContainerColor
              : notActiveCategoryContainerColor,
          border: Border.all(
            color: borderColor,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.catValue,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

List<Widget> listOfItems(Iterable categories) {
  List<Widget> listOfItems = [];
  categories.forEach((category) {
    listOfItems.add(ListViewCategoryItem(
        category.value,
        category.name,
        (Globals.chosenCategories.contains(category.name) ||
                (Globals.chosenCategories.isEmpty && listOfItems.isEmpty))
            ? true
            : false));
  });

  return listOfItems;
}
