// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../core/models.dart';
//import 'package:flutter_svg/flutter_svg.dart';

Future<Iterable<CocktailDefinition>> _getCocktailDefinitions(
    CocktailCategory cocktailCategory) {
  return AsyncCocktailRepository()
      .fetchCocktailsByCocktailCategory(cocktailCategory);
}

class CocktailsFilterScreen extends StatefulWidget {
  final Iterable<CocktailCategory> _cocktailCategories =
      CocktailCategory.values;

  @override
  State<CocktailsFilterScreen> createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  CocktailCategory? _currentCocktailCategory = CocktailCategory.ordinaryDrink;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [Color(0xff1A1927), Color(0xff0B0B12)])),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _searchHeader(),
              ),
              SliverToBoxAdapter(
                child: _chipsSelectorPart(),
              ),
              SliverFillRemaining(
                child: _gridCocktailPart(_currentCocktailCategory!),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchHeader() {
    var _controller = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      //   color: const Color(0xff181723),
      child: TextField(
        cursorColor: Theme.of(context).primaryColor,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        onChanged: null,
        controller: _controller,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
            //fillColor: Colors.white,
            //focusColor: const Color(0xffFFFFFF),
            suffixIcon: IconButton(
              onPressed: _controller.clear,
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.clear),
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(65.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(65.0)),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset('assets/images/Vector.png'),
            )),
      ),
    );
  }

  Widget _chipsSelectorPart() {
    return Container(
      // color: const Color(0xff1A1926),
      height: 56,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...widget._cocktailCategories
              .map((catigory) => _chipsGenerator(catigory))
        ],
      ),
    );
  }

  Widget _chipsGenerator(CocktailCategory cocktailCategory) {
    final CocktailCategory localCocktailCategory = cocktailCategory;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentCocktailCategory = localCocktailCategory;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Chip(
            backgroundColor: localCocktailCategory == _currentCocktailCategory
                ? const Color(0xff3B3953)
                : const Color(0xff201F2C),
            shape:
                StadiumBorder(side: BorderSide(color: const Color(0xff2D2C39))),
            label: Text(
              localCocktailCategory.value,
              style: TextStyle(
                  fontFamily: 'SfProText',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: const Color(0xffFFFFFF)),
            )),
      ),
    );
  }

  Widget _gridCocktailPart(CocktailCategory cocktailCategory) {
    return FutureBuilder(
      //   initialData: [],
      future: _getCocktailDefinitions(cocktailCategory),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {}
        if (snapshot.connectionState == ConnectionState.waiting) {}
        if (snapshot.connectionState == ConnectionState.active) {}
        if (snapshot.connectionState == ConnectionState.done) {}
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: const TextStyle(
                fontFamily: 'SfProText',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xffEAEAEA),
              ),
              textAlign: TextAlign.center,
            ),
          );
        }
        if (snapshot.hasData) {
          // print('connectionState: ${snapshot.connectionState}');
          // print('data:${snapshot.data.toString()}');
          return GridView(
            padding:
                const EdgeInsets.only(left: 26, top: 5, right: 26, bottom: 5),
            children: [
              ...(snapshot.data as Iterable<CocktailDefinition>).map(
                  (e) => _cocktailCard(e.drinkThumbUrl, e.name, 'id:${e.id}'))
            ],
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 0.7),
          );
        }
        // print('connectionState: ${snapshot.connectionState}');
        // print('data:${snapshot.data.toString()}');
        return Center(
          child: SizedBox(
            height: 60,
            child: Column(
              children: [
                Image.asset('assets/images/shaker1.png'),
                Text('Поиск...')
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _cocktailCard(String imageUrl, String name, String id) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        footer: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(15.0),
                  bottomRight: const Radius.circular(15.0)),
              gradient: LinearGradient(colors: [
                const Color(0xff000000).withOpacity(0.0),
                const Color(0xff000000).withOpacity(1.0),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                // flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 13, 16, 0),
                  child: Text('"$name"',
                      style: const TextStyle(
                        fontFamily: 'SfProText',
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: const Color(0xffFFFFFF),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(14, 7, 0, 14),
                child: Chip(
                    backgroundColor: const Color(0xff201F2C),
                    shape: StadiumBorder(
                        side: BorderSide(color: const Color(0xff2D2C39))),
                    label: Text(
                      id,
                      style: const TextStyle(
                        fontFamily: 'SfProText',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: const Color(0xffFFFFFF),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
