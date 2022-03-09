import 'package:cocktail/core/models.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  SearchItem({Key? key, required this.item}) : super(key: key);

  final CocktailDefinition? item;
  @override
  Widget build(BuildContext context) {
    return (item == null)
        ? Container()
        : Container(
            child: Container(
              width: 160,
              height: 215,
              child: Stack(
                children: [
                  Positioned(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image(
                        image: NetworkImage(item!.drinkThumbUrl),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 14,
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            width: 110,
                            child: Text(
                              item!.name,
                              maxLines: 3,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            )),
                        Chip(
                            backgroundColor: Color(0xff15151C),
                            label: Text(
                              'id:${item!.id}',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
