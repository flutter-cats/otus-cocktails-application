import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CocktailImageWidget extends StatelessWidget {
  const CocktailImageWidget({
    Key? key,
    required this.width,
    required this.cocktailImageUrl,
  }) : super(key: key);

  final double width;
  final String cocktailImageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(cocktailImageUrl),
        Positioned(
          top: 10,
          left: 20,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/icon_back.svg',
              width: 24.0,
              height: 24.0,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 8,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/icon_out.svg',
              width: 24.0,
              height: 24.0,
            ),
          ),
        ),
      ],
    );
  }
}

// without Stack, facing problem with constraining size
// class CocktailImageWidget extends StatelessWidget {
//   const CocktailImageWidget({
//     Key? key,
//     required this.width,
//     required this.cocktailImageUrl,
//   }) : super(key: key);
//
//   final double width;
//   final String cocktailImageUrl;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: BoxConstraints.expand(width: width, height: width),
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           fit: BoxFit.cover,
//           image: NetworkImage(cocktailImageUrl),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Align(
//           alignment: Alignment.topCenter,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: SvgPicture.asset(
//                   'assets/images/icon_back.svg',
//                   width: 24.0,
//                   height: 24.0,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: SvgPicture.asset(
//                   'assets/images/icon_out.svg',
//                   width: 24.0,
//                   height: 24.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
