import 'package:flutter/material.dart';

import '../../../core/src/extensions/Color+Extensions.dart';
import '../../../core/models.dart';

class CoctailDetailsInfo extends StatelessWidget {
  final String title;
  final String id;
  final bool isFavorit;
  final CocktailCategory? category;
  final CocktailType? typeCoctail;
  final GlassType? typeGlass;

  const CoctailDetailsInfo(
      {Key? key,
      required this.title,
      required this.id,
      required this.isFavorit,
      required this.category,
      required this.typeCoctail,
      required this.typeGlass});

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
            value: category?.name ?? 'No Category',
          ),
          CoctailDetailsTypeItem(
            title: 'Тип Коктейля',
            value: typeCoctail?.name ?? 'No type Coctail',
          ),
          CoctailDetailsTypeItem(
            title: 'Тип стекла',
            value: typeGlass?.name ?? 'no tyep glass',
          )
        ],
      ),
    );
  }
}

class CoctailDetailsTypeItem extends StatelessWidget {
  final String title;
  final String value;

  const CoctailDetailsTypeItem(
      {Key? key, required this.title, required this.value});

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
  const CoctailDetailsInfoHeader(
      {Key? key,
      required this.id,
      required this.title,
      required this.isFavorit});
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
