import 'package:flutter/material.dart';
import 'package:homework/style/app_text_style.dart';

class CoctailImage extends StatelessWidget {
  const CoctailImage({
    Key key,
    @required this.image,
  }) : super(key: key);

  final String image;
  final String errorLoadingMessage = 'Loading image error';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          image,
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            final progress = (loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${(progress * 100).toInt()} %'),
                  const SizedBox(
                    height: 16,
                  ),
                  CircularProgressIndicator(value: progress)
                ],
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(
            child: Text(
              errorLoadingMessage,
              style: AppTextStyle.errorText,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(14, 13, 19, 0),
                Colors.black,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
