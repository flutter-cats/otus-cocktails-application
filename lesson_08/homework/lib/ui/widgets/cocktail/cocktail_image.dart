import 'package:flutter/material.dart';
import 'package:cocktail/style/style.dart';

class CoctailImage extends StatelessWidget {
  CoctailImage({
    Key key,
    @required this.image,
    this.imageFit = CoctailImageFit.fitWidth,
  }) : super(key: key);

  final String image;
  final String errorLoadingMessage = 'Loading image error';
  CoctailImageFit imageFit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          image,
          fit: this.imageFit == CoctailImageFit.fitWidth
              ? BoxFit.fitWidth
              : BoxFit.fitHeight,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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

class CoctailImageFit {
  static const CoctailImageFit fitWidth =
      CoctailImageFit._('fitWidth', 'Fit width');
  static const CoctailImageFit fitHeight =
      CoctailImageFit._('height', 'Fit height');

  static const Iterable<CoctailImageFit> values = [
    fitWidth,
    fitHeight,
  ];

  final String value;
  final String name;

  const CoctailImageFit._(this.name, this.value);

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoctailImageFit &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  String toString() => 'CoctailImageFit{value: $value, name: $name}';
}
