import 'package:flutter/material.dart';
import 'package:homework/extensions/Color+Extensions.dart';
import 'package:homework/models/models.dart';
import 'package:homework/models/src/model/cocktail_type.dart';

class CoctailDetailsInfo extends StatelessWidget {
  final String title;
  final String id;
  final bool isFavorit;
  final CocktailCategory category;
  final CocktailType typeCoctail;
  final GlassType typeGlass;

  CoctailDetailsInfo(
      {this.title,
      this.id,
      this.isFavorit,
      this.category,
      this.typeCoctail,
      this.typeGlass});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#1A1927'),
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoctailDetailsInfoHeader(
            id: id,
            title: title,
            isFavorit: isFavorit,
          ),
          CoctailDetailsTypeItem(
            title: "Категория коктейля",
            value: category.name,
          ),
          CoctailDetailsTypeItem(
            title: 'Тип Коктейля',
            value: typeCoctail.name,
          ),
          CoctailDetailsTypeItem(
            title: 'Тип стекла',
            value: typeGlass.name,
          )
        ],
      ),
    );
  }
}

class CoctailDetailsTypeItem extends StatelessWidget {
  final String title;
  final String value;
  CoctailDetailsTypeItem({this.title, this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(20)),
                color: HexColor('#15151C')),
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Text(value,
                style: TextStyle(color: Colors.white, fontSize: 14)),
          )
        ],
      ),
    );
  }
}

// Info Header
class CoctailDetailsInfoHeader extends StatelessWidget {
  final String id;
  final String title;
  final bool isFavorit;
  CoctailDetailsInfoHeader({this.id, this.title, this.isFavorit});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 23, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              IconButton(
                onPressed: () {
                  print("Toggle favorit");
                },
                icon: Icon(isFavorit ? Icons.favorite : Icons.favorite_border),
                color: Colors.white,
              ),
            ],
          ),
          Text(
            'id: ${id}',
            style: TextStyle(color: HexColor('#848396'), fontSize: 13),
          ) // ${id}
        ],
      ),
    );
  }
}
