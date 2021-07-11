import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/models/models.dart';
import 'package:homework/themes/app_text_theme.dart';

class Details extends StatelessWidget {
  const Details({
    Key key,
    @required this.cocktail,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 5,
                child: Text(
                  cocktail.name,
                  style: AppTextTheme.headline6,
                ),
              ),
              Flexible(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/icon_hart.svg',
                  ),
                ),
              )
            ],
          ),
          Text('id:${cocktail.id}', style: AppTextTheme.caption),
          const SizedBox(height: 8.0),
          DetailColumn(
            title: 'Категория коктейля',
            value: cocktail.category.value,
          ),
          DetailColumn(
            title: 'Тип коктейля',
            value: cocktail.cocktailType.value,
          ),
          DetailColumn(
            title: 'Тип стекла',
            value: cocktail.glassType.value,
          ),
        ],
      ),
    );
  }
}

class DetailColumn extends StatelessWidget {
  const DetailColumn({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextTheme.subtitle2),
          const SizedBox(height: 8.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: const Color(0xFF15151C),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(value, style: AppTextTheme.subtitle1),
          ),
        ],
      ),
    );
  }
}
