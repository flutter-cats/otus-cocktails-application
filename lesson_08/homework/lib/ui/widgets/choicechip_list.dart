import 'package:flutter/material.dart';
import '../../core/models.dart';

class ChoiceChipList extends StatefulWidget {
  ChoiceChipList({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoiceChipList> createState() => _ChoiceChipListState();
}

class _ChoiceChipListState extends State<ChoiceChipList> {
  int choice = 0;

  @override
  void initState() {
    asyncCR.addToStreamCocktailDefinition(CocktailCategory.values.toList()[0]);
    super.initState();
  }

  @override
  void dispose() {
    asyncCR.controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: EdgeInsets.only(bottom: 22),
      child: ListView.separated(
        padding: EdgeInsets.only(left: 8),
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: CocktailCategory.values.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ChoiceChip(
            label: Text(
              CocktailCategory.values.toList()[index].value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            selected: (index == choice) ? true : false,
            elevation: 0,
            side: BorderSide(
                color:
                    (index == choice) ? Color(0xFF3B3953) : Color(0xFF464551),
                width: 1),
            selectedColor: Color(0xFF3B3953),
            backgroundColor: Color(0xFF201F2C),
            onSelected: (selected) {
              setState(() {
                if (selected) choice = index;
                asyncCR.addToStreamCocktailDefinition(
                    CocktailCategory.values.toList()[index]);
              });
            },
          );
        },
      ),
    );
  }
}
