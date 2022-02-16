import 'package:flutter/material.dart';
import 'package:homework/state_widget.dart';
import 'package:homework/ui/pages/detail/description_item.dart';
import 'package:homework/ui/pages/detail/favourite_button.dart';
import '../../../models/res/app_colors.dart';
import '../../../models/res/strings.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.cocktailName,
    required this.cocktailId,
    required this.cocktailCategory,
    required this.cocktailType,
    required this.glassType,
  }) : super(key: key);

  final String cocktailName;
  final String cocktailId;
  final String cocktailCategory;
  final String cocktailType;
  final String glassType;

  @override
  Widget build(BuildContext context) {
    final isFavourite = StateInheritedWidget.of(context).isFavourite;
    return Container(
      padding: const EdgeInsets.fromLTRB(32.0, 22.0, 32.0, 18.0),
      color: AppColors.alternativeBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            leading: Text(
              cocktailName,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            trailing: FavouriteButton(isFavourite: isFavourite),
          ),
          Text(
            'id:${cocktailId}',
            style: const TextStyle(
              fontSize: 13.0,
              color: AppColors.idColor,
            ),
          ),
          DescriptionItem(
            descriptionName: Strings.cocktailCategory,
            descriptionValue: cocktailCategory,
          ),
          DescriptionItem(
              descriptionName: Strings.cocktailType,
              descriptionValue: cocktailType),
          DescriptionItem(
            descriptionName: Strings.glassType,
            descriptionValue: glassType,
          ),
        ],
      ),
    );
  }
}
