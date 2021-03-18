import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/components/cocktail_description_item.dart';
import 'package:homework/text_styles.dart';

class CoctailDescriptionWidget extends StatelessWidget {
  final String id;
  final String name;
  final String category;
  final String type;
  final String glassType;

  const CoctailDescriptionWidget(
      {this.id, this.name, this.type, this.glassType, this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1A1927),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(32.0, 33, 32, 18),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoctailDescriptionItem(
                      label: name,
                      textStyle: cocktailNameHeaderStyle,
                      bottomMargin: 10.0,
                      leftMargin: 0,
                    ),
                    CoctailDescriptionItem(
                      label: 'id: $id',
                      bottomMargin: 20.0,
                      textStyle: descriptionIdStyle,
                    ),
                    CoctailDescriptionItem(
                      label: 'Категория коктейля',
                      bottomMargin: 8.0,
                      textStyle: cocktailTypeStyle,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      margin: EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.black),
                      child: CoctailDescriptionItem(
                        label: category,
                        // leftMargin: 16.0,
                        // bottomPadding: 24.0,
                        textStyle: cocktailValueStyle,
                      ),
                    ),
                    CoctailDescriptionItem(
                      label: 'Тип коктейля',
                      bottomMargin: 10.0,
                      textStyle: cocktailTypeStyle,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.black),
                      child: CoctailDescriptionItem(
                        label: type,
                        textStyle: cocktailValueStyle,
                      ),
                    ),
                    CoctailDescriptionItem(
                      label: 'Тип Стекла',
                      bottomMargin: 10.0,
                      textStyle: cocktailTypeStyle,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.black),
                      child: CoctailDescriptionItem(
                        label: glassType,
                        textStyle: cocktailValueStyle,
                      ),
                    ),
                  ],
                ),
                Spacer(),
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
