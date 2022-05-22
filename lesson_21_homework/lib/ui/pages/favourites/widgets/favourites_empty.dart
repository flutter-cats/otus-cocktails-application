import 'package:flutter/material.dart';

class FavouritesEmpty extends StatelessWidget {
  const FavouritesEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('📝', style: TextStyle(fontSize: 64)),
          Text(
            'В избранном ничего нет!',
          ),
        ],
      ),
    );
  }
}
