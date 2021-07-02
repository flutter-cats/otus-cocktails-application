import 'package:flutter/material.dart';

// Упрощение с помощью внутренних методов
// Их разумно использовать для разбиения если полученный виджет
// нигде не будет использоваться кроме этого виджета.

class BigWidget extends StatefulWidget {
  @override
  _BigWidgetState createState() => _BigWidgetState();
}

class _BigWidgetState extends State<BigWidget> {
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
        _buildAvatar(userImageUrl),
        const SizedBox(height: 8),
        _buildNameChip(userName),
        _buildActionsBar()
      ],
    );
  }

  Widget _buildAvatar(String url) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.network(
          url,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildNameChip(String name) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildActionsBar() {
    return Row(
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
  }
}
