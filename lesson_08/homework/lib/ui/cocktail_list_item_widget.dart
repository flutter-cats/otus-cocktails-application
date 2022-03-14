import 'package:cocktail/core/models.dart';
import 'package:cocktail/ui/colors.dart';
import 'package:flutter/material.dart';

class CocktailListItemWidget extends StatelessWidget {
  final CocktailDefinition value;
  final BuildContext context;

  const CocktailListItemWidget({required this.context, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 215,
      width: 160,
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(10))),
      clipBehavior: Clip.antiAlias,
      child: Stack(children: [
        Image.network(value.drinkThumbUrl),
        Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Text(value.name, textAlign: TextAlign.start, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, bottom: 16),
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                  child: Text('id: ${value.id}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400)),
                ),
                decoration: BoxDecoration(
                    color: ListIdBackgroundColor,
                    border: Border.all(
                      color: ListIdBorderColor,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(30)))),
          )
        ])
      ]),
    );
  }
}
