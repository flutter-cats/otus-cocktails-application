import 'package:flutter/material.dart';
import 'package:homework/ui/style/colors.dart';
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
      color: CustomColors.background,
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
                color: CustomColors.black),
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
class CoctailDetailsInfoHeader extends StatefulWidget {
  final String id;
  final String title;
  bool isFavorit;
  CoctailDetailsInfoHeader(
      {Key? key,
      required this.id,
      required this.title,
      required this.isFavorit});

  @override
  _CoctailDetailsInfoHeaderState createState() =>
      _CoctailDetailsInfoHeaderState();
}

class _CoctailDetailsInfoHeaderState extends State<CoctailDetailsInfoHeader>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 200),
    lowerBound: 0.0,
    upperBound: 0.2,
  )..addListener(() {
      setState(() {});
    });

  late double _scale;

  // late final Animation<double> _animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.fastOutSlowIn,
  // );

  void _updateFavorit() {
    if (widget.isFavorit) {
      widget.isFavorit = false;
      _controller.forward();
    } else {
      widget.isFavorit = true;
      _controller.reverse();
    }
  }

  // @override
  // void initState() {
  //   _controller.addListener(() {
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 23, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flexible(
              child: Text(
                widget.title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            IconButton(
                icon: Transform.scale(
                  scale: _scale,
                  child: Icon(
                    widget.isFavorit ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                onPressed: () => _updateFavorit())
          ]),
          Text(
            'id: ${widget.id}',
            style: TextStyle(color: CustomColors.headline2, fontSize: 13),
          ) // ${id}
        ],
      ),
    );
  }
}
