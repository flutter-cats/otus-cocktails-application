import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorited;
  FavoriteButton(this.isFavorited);
  @override
  _FavoriteButtonWidgetState createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButton> {
  final String iconHart = 'assets/images/icon_hart.svg';
  bool _isFavorited;

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: SvgPicture.asset(
          iconHart,
          color:
              _isFavorited ? Colors.white : Color.fromRGBO(255, 255, 255, 0.3),
        ),
        color: Colors.green,
        onPressed: _toggleFavorite,
      ),
    );
  }

  void _toggleFavorite() {
    setState(() => _isFavorited = !_isFavorited);
    print('Is favorited: $_isFavorited');
  }
}
