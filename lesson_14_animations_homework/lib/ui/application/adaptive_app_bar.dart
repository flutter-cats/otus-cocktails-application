import 'package:flutter/material.dart';
import 'package:lesson_14_animations_homework/ui/style/custom_colors.dart';

const applicationBarHeight = 40.0;

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AdaptiveAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(applicationBarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: CustomColors.background,
        automaticallyImplyLeading: true,
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      );
}
