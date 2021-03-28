import 'package:flutter/material.dart';

final gifUrl =
    'https://i.pinimg.com/originals/1b/8e/89/1b8e89ce111016cf512f58d384e777cf.gif';

final bigImageUrl = 'https://wallpaperaccess.com/full/1752578.jpg';

class ImageSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: _buildImage(AssetImage('assets/flutter.png')));
  }

  Widget _buildImage(ImageProvider imageProvider) {
    return Image(
      image: imageProvider,
    );
  }

  Widget _buildGifImage(String url) {
    return Image.network(
      url,
      frameBuilder: (context, child, frame, bool wasSynchronouslyLoaded) {
        return Stack(
          children: [child, Center(child: Text(frame?.toString() ?? ''))],
        );
      },
    );
  }

  Widget _buildBigImage(String url) {
    return Image.network(
      url,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        final progress = (loadingProgress.cumulativeBytesLoaded /
            loadingProgress.expectedTotalBytes!);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${(progress * 100).toInt()} %'),
              const SizedBox(height: 16),
              CircularProgressIndicator(value: progress)
            ],
          ),
        );
      },
    );
  }
}
