import 'package:flutter/material.dart';

class FavouritesError extends StatelessWidget {
  const FavouritesError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('🙈', style: TextStyle(fontSize: 64)),
          Text(
            'Что-то пошло не так!',
          ),
        ],
      ),
    );
  }
}
