import 'package:flutter/material.dart';
import 'package:homework/core/models.dart';
import 'package:homework/core/src/model/cocktail_definition.dart';
import 'package:homework/core/src/repository/async_cocktail_repository.dart';
import 'package:homework/ui/coctail_detail_page.dart';

class CocktailGridItem extends StatelessWidget {
  const CocktailGridItem(this.cocktailDefinition, {Key? key}) : super(key: key);

  static const double aspectRatio = 170 / 215;

  final CocktailDefinition cocktailDefinition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('onTap was pressed');
        Navigator.pushNamed(context, CocktailDetailPage.routeName, arguments: cocktailDefinition.id);
        //print ('Коктейль = ${(await _getCocktailDetails(cocktailDefinition.id)).toString()}');
        //_getCocktailDetails(cocktailDefinition.id).then((value)=>print('Коктейль = ${value.toString()}'));
       // _passToCocktailDetailedPage(cocktailDefinition.id.toString());
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      stops: [0.44, 0.94],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(14, 13, 19, 0),
                        Color(0xFF0E0D13)
                      ])),
              position: DecorationPosition.foreground,
              child: Image.network(
                cocktailDefinition.drinkThumbUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cocktailDefinition.name,
                        style: Theme.of(context).textTheme.bodyText1),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  // Widget _passToCocktailDetailedPage(String cocktailId) {
  //   print('Внутри _passToCocktailDetailedPage()');
  //   return FutureBuilder(
  //     future: _getCocktailDetails(cocktailId),
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       if (snapshot.connectionState == ConnectionState.none) {}
  //       if (snapshot.connectionState == ConnectionState.waiting) {}
  //       if (snapshot.connectionState == ConnectionState.active) {}
  //       if (snapshot.connectionState == ConnectionState.done) {}
  //       if (snapshot.hasError) {
  //         return Center(
  //           child: Text(
  //             snapshot.error.toString(),
  //             style: const TextStyle(
  //               fontFamily: 'SfProText',
  //               fontWeight: FontWeight.w400,
  //               fontSize: 14,
  //               color: const Color(0xffEAEAEA),
  //             ),
  //             textAlign: TextAlign.center,
  //           ),
  //         );
  //       }
  //       if (snapshot.hasData) {
  //         print('Снэпшот дата равна = ${snapshot.data.toString()}');
  //         Navigator.pushNamed(context, CocktailDetailPage.routeName,
  //             arguments: snapshot.data as Cocktail);
  //       }
  //       // print('connectionState: ${snapshot.connectionState}');
  //       // print('data:${snapshot.data.toString()}');
  //       return Center(
  //         child: SizedBox(
  //           height: 60,
  //           child: Column(
  //             children: [
  //               Image.asset('assets/images/shaker1.png'),
  //               Text('Поиск...')
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
