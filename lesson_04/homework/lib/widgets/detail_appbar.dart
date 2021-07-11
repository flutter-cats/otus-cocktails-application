import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/images/icon_back.svg'),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/images/icon_out.svg'),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
