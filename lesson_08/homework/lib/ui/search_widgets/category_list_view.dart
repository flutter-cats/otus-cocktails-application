import 'package:cocktail/core/models.dart';
import 'package:cocktail/ui/search_widgets/res/consts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({Key? key}) : super(key: key);
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  var index = 0;
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

class ListViewCategoryItem extends StatelessWidget {
  final String catValue;
  final String catName;
  const ListViewCategoryItem(this.catValue, this.catName, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      height: 46,
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: true
            ? activeCategoryContainerColor
            : notActiveCategoryContainerColor,
        border: Border.all(
          color: borderColor,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        catValue,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

List<Widget> listOfItems(Iterable categories) {
  List<Widget> listOfItems = [];
  categories.forEach((category) {
    listOfItems.add(ListViewCategoryItem(category.value, category.name));
  });

  return listOfItems;
}
