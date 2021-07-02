import 'package:flutter/material.dart';

// пример большого виджета
class BigWidget extends StatelessWidget {
  final userName = 'Name';
  final userImageUrl =
      'http://wallpapers-image.ru/2560x1600/movies/wallpapers/movies-images-2560x1600-15.jpg';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.network(
            userImageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.grey,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            userName,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  // call method
                },
                child: Text('Call')),
            TextButton(
                onPressed: () {
                  // delete method
                },
                child: Text('Delete'))
          ],
        )
      ],
    );
  }
}
