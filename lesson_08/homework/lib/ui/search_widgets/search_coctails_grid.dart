import 'package:cocktail/core/models.dart';
import 'package:cocktail/ui/search_widgets/res/consts.dart';
import 'package:cocktail/ui/search_widgets/res/styles.dart';
import 'package:flutter/material.dart';

class SearchCoctailsGrid extends StatefulWidget {
  final Iterable<CocktailDefinition> listOfoctails;
  const SearchCoctailsGrid(this.listOfoctails, {Key? key}) : super(key: key);

  @override
  _SearchCoctailsGridState createState() => _SearchCoctailsGridState();
}

class _SearchCoctailsGridState extends State<SearchCoctailsGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        children: [
          ...coctailGridItem(widget.listOfoctails),
        ],
      ),
    );
  }
}

Iterable<Widget> coctailGridItem(Iterable<CocktailDefinition> listOfoctails) {
  List<Container> containers = [];
  listOfoctails.forEach((coctail) {
    containers.add(
      Container(
        width: 170,
        height: 215,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(
              coctail.drinkThumbUrl,
            ),
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coctail.name,
                style: commonTextStyle(),
              ),
              Container(
                margin: EdgeInsets.only(top: 6),
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: coctailBoxColor,
                  border: Border.all(
                    color: coctailBoxBorderColor,
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      coctail.id,
                      style: commonTextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
  return containers;
}




// class CoctailGridItem extends StatelessWidget {
//   final Iterable listOfCoctails;
//   List<Container> containers;
//   const CoctailGridItem(this.listOfCoctails, {Key? key}) : super(key: key);

  

//   @override
//   Widget build(BuildContext context) {
//      Container(
//       width: 170,
//       height: 215,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         image: DecorationImage(
//           fit: BoxFit.fitHeight,
//           image: NetworkImage(
//               'https://www.thecocktaildb.com/images/media/drink/qvprvp1483388104.jpg'),
//         ),
//       ),
//       alignment: Alignment.bottomLeft,
//       child: Container(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '«Арбузный» Мохито',
//               style: commonTextStyle(),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 6),
//               height: 24,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: coctailBoxColor,
//                 border: Border.all(
//                   color: coctailBoxBorderColor,
//                 ),
//               ),
//               padding: EdgeInsets.only(
//                 left: 16,
//                 right: 16,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'id:12345',
//                     style: commonTextStyle(fontSize: 10),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
