// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/core/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const BackgroundColor = Color(0xFF1A1926);
const SelectedColor = Color(0xFF3B3953);
const TextColor = Colors.white;
const CardBackgroundColor = Colors.black;

class CocktailsFilterScreen extends StatefulWidget {
  @override
  State<CocktailsFilterScreen> createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {

  CocktailCategory _cocktailCategory = CocktailCategory.values.first;

  Widget searchBar() {
    return Container (
        color: BackgroundColor,
      height: 40,
    child:
        Padding(
          padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
            child:
        TextField(
            style: TextStyle(color: TextColor),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: SelectedColor)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: SelectedColor)
            ),
        hintText: "",
        labelText: "",
        prefixIcon: Icon(Icons.person),
          suffix: Icon(Icons.person)
    )
    )
    )
    );
  }

  Widget cocktailCategories() {
    return Container(
        color: BackgroundColor,
        height: 46,
        child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
        children: CocktailCategory.values.map((e) => cocktailCategoryButton(e)).toList()
      )
    )
    );
  }

  Widget cocktailCategoryButton(CocktailCategory cocktailCategory) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
        child:
        ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child:
        Container(
          height: 46,
          color: SelectedColor,
          child: TextButton(
              onPressed: () => setState(() {
                _cocktailCategory = cocktailCategory;
              }),
              child: Text(
                  cocktailCategory.name,
                style: TextStyle(color: TextColor),
              )
          ),
        )
        )
    );
  }

  Widget cocktailsFeed() {
    return FutureBuilder(
      future: AsyncCocktailRepository().fetchCocktailsByCocktailCategory(_cocktailCategory),
      builder: (BuildContext context, AsyncSnapshot<Iterable<CocktailDefinition>> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        else if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        else if (snapshot.hasData && snapshot.data != null) {
          final cocktails = snapshot.data!.toList();
          return Expanded(
              child:
                  Container(
                  color: BackgroundColor,
              child:
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
              color: BackgroundColor,
              child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: <Widget>[
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return cocktailCard(cocktails[index]);
                  },
                  childCount: cocktails.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.0,
                ),
              ),
            ],
          )
          )
              )
                  )
          );
        }
        else {
          return Text("Something went wrong, please ask your local sysadmin for help.");
        }
      }
    );
  }

  Widget cocktailCard(CocktailDefinition cocktailDefinition) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    child: Container(
        color: CardBackgroundColor,
        child: Stack(
          children: [
            Image.network(cocktailDefinition.drinkThumbUrl),
            Column(
              children: [
                Spacer(flex: 50),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Column (
                    children: [
                      Text(
                    cocktailDefinition.name,
                    style: TextStyle(
                        color: TextColor,
                      fontSize: 20
                    ),
                  ),
                      Container(
                        color: SelectedColor,
                      height: 24,
                      child: Text(
                        "id: ${cocktailDefinition.id}",
                        style: TextStyle(
                            color: TextColor,
                            fontSize: 16
                        ),
                      )
                      ),
                  ]
                  )
                ),
                Spacer(flex: 30),
              ],
            )
          ],
        )
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            color: BackgroundColor,
            height: 50,
          ),
          searchBar(),
          Container(height: 22, color: BackgroundColor),
          cocktailCategories(),
          Container(height: 22, color: BackgroundColor),
          cocktailsFeed()
        ],
      );
  }
}
