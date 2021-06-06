import 'dart:io';

import 'package:cocktail/core/models.dart';
import 'package:cocktail/core/src/model/cocktail_category.dart';
import 'package:cocktail/res/application_colors.dart';
import 'package:cocktail/ui/cocktail_detail_page/cocktail_detail_page.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final _searchStringController = TextEditingController();
  CocktailCategory _selectedCocktailCategory = CocktailCategory.values.first;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          _searchString(size),
          _cocktailCategoryChips(),
          _cocktailsGrid()
        ],
      )),
    );
  }

  Widget _searchString(Size size) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: size.width * 0.95,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(65),
            ),
            child: Stack(alignment: const Alignment(1.0, 1.0), children: [
              TextField(
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(color: Colors.white),
                controller: _searchStringController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                textInputAction: TextInputAction.search,
                onChanged: (text) {
                  setState(() {});
                },
              ),
              _searchStringController.text.length > 0
                  ? IconButton(
                      onPressed: () {
                        _searchStringController.clear();
                      },
                      icon: Icon(Icons.close, color: Colors.grey))
                  : SizedBox()
            ])));
  }

  Widget _cocktailCategoryChips() {
    List<Widget> chips = CocktailCategory.values
        .map((e) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ChoiceChip(
                label: Text(
                  e.value.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                labelPadding: EdgeInsets.all(5),
                selected: _selectedCocktailCategory == e,
                backgroundColor: ApplicationColors.instructionBackground,
                selectedColor: ApplicationColors.selectedBackgroundColor,
                //shape: ,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedCocktailCategory = e;
                  });
                },
              ),
            ))
        .toList();

    return Container(
        height: 50,
        child: ListView(scrollDirection: Axis.horizontal, children: chips));
  }

  Widget _cocktailsGrid() {
    return FutureBuilder(
        future: AsyncCocktailRepository()
            .fetchCocktailsByCocktailCategory(_selectedCocktailCategory),
        builder: (BuildContext context,
            AsyncSnapshot<Iterable<CocktailDefinition>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          if (snapshot.hasData) {
            return Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(25),
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.8),
                    itemBuilder: (context, index) => Center(
                          child: _cocktailTile(snapshot.data.elementAt(index)),
                        )));
          }

          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
        });
  }

  Widget _cocktailTile(CocktailDefinition cocktail) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image(
              width: 200,
              height: 300,
              image: NetworkImage(cocktail.drinkThumbUrl),
              fit: BoxFit.fitHeight,
            ),
            Positioned(
                bottom: 5,
                left: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        cocktail.name,
                        style: TextStyle(color: Colors.white),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: ApplicationColors.selectedBackgroundColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text('id: ${cocktail.id}',
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    )
                  ],
                )),
            Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.blueGrey,
                  onTap: () {
                    _navigateToDetailPage(context, cocktail.id);
                  },
                )),
          ],
        ));
  }

  void _navigateToDetailPage(BuildContext context, String cocktailId) async {
    Cocktail _cocktail;

    try {
      _cocktail =
          await AsyncCocktailRepository().fetchCocktailDetails(cocktailId);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CocktailDetailPage(_cocktail)));
    } catch (e) {
      throw HttpException(e.toString());
    }
  }
}
