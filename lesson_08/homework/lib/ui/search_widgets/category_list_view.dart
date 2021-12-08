import 'package:cocktail/ui/search_widgets/res/consts.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ListViewCategoryItem(index),
          ListViewCategoryItem(1),
          ListViewCategoryItem(2),
          ListViewCategoryItem(3),
          ListViewCategoryItem(4),
          ListViewCategoryItem(5),
          ListViewCategoryItem(6),
          ListViewCategoryItem(7),
          ListViewCategoryItem(8),
        ],
      ),
    );
  }
}

class ListViewCategoryItem extends StatelessWidget {
  const ListViewCategoryItem(int index, {Key? key}) : super(key: key);

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
        'Какой-то коктейль',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
