import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework_4/components/description_item_widget.dart';
import 'package:homework_4/components/description_item_small_widget.dart';
import 'package:homework_4/style/text_style.dart';

class DescriptionWidget extends StatelessWidget {
  final String id;
  final String name;
  final String category;
  final String type;
  final String glassType;

  const DescriptionWidget({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.glassType,
    @required this.category
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1A1927),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(32.0, 33, 32, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DescriptionItemWidget(
                  label: name,
                  textStyle: cocktailMainTitle,
                  bottomMargin: 10.0,
                  leftMargin: 0,
                ),
                DescriptionItemWidget(
                  label: 'id: $id',
                  bottomMargin: 20.0,
                  textStyle: cocktailIdTitle,
                ),
                DescriptionItemWidget(
                  label: 'Категория коктейля',
                  bottomMargin: 8.0,
                  textStyle: cocktailTypeStyle,
                ),
                DescriptionItemSmallWidget(
                  bottomMargin: 18,
                  child: DescriptionItemWidget(
                    label: category,
                    textStyle: cocktailValueStyle,
                  ),
                ),
                DescriptionItemWidget(
                  label: 'Тип коктейля',
                  bottomMargin: 10.0,
                  textStyle: cocktailTypeStyle,
                ),
                DescriptionItemSmallWidget(
                  bottomMargin: 16,
                  child: DescriptionItemWidget(
                    label: type,
                    textStyle: cocktailValueStyle,
                  ),
                ),
                DescriptionItemWidget(
                  label: 'Тип Стекла',
                  bottomMargin: 10.0,
                  textStyle: cocktailGlassStyleTitle
                ),
                DescriptionItemSmallWidget(
                  child: DescriptionItemWidget(
                    label: glassType,
                    textStyle: cocktailGlassStyle,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30.0,
            right: 30.0,
            child: SvgPicture.asset('assets/images/icon_hart.svg'),
          ),
        ],
      ),
    );
  }
}
