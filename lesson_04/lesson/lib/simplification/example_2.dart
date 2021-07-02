import 'package:flutter/material.dart';

// Упрощение с помощью локальных переменных.
class BigWidget extends StatelessWidget {
  final userName = 'Name';
  final userImageUrl =
      'http://wallpapers-image.ru/2560x1600/movies/wallpapers/movies-images-2560x1600-15.jpg';

  @override
  Widget build(BuildContext context) {
    Widget avatar = ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.network(
        userImageUrl,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );

    Widget nameField = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        userName,
        style: TextStyle(color: Colors.white),
      ),
    );

    Widget actionsBar = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            // call method
          },
          child: const Text('Call'),
        ),
        TextButton(
          onPressed: () {
            // delete method
          },
          child: const Text('Delete'),
        )
      ],
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        avatar,
        const SizedBox(height: 8),
        nameField,
        actionsBar,
      ],
    );
  }
}
