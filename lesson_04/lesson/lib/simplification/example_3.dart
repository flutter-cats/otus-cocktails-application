import 'package:flutter/material.dart';

// Упрощение с помощью выноса кода в отдельные виджеты
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
        _UserAvatar(userImageUrl: userImageUrl),
        const SizedBox(height: 8),
        _UserChip(name: userName),
        _UserActionsBar()
      ],
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({Key? key, required this.userImageUrl}) : super(key: key);

  final String userImageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.network(
        userImageUrl,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _UserChip extends StatelessWidget {
  const _UserChip({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class _UserActionsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
