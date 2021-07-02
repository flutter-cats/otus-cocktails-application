// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'dart:async';

import 'package:cocktail/core/models.dart';
import 'package:flutter/material.dart';

class CocktailsFilterScreen extends StatefulWidget {
  @override
  _CocktailsFilterScreenState createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  final TextEditingController _controller = TextEditingController();
  CocktailCategory _chosenCategory = CocktailCategory.values.first;
  StreamController<CocktailDefinition> _cocktailsStreamController;

  @override
  void initState() {
    _cocktailsStreamController = StreamController();
    super.initState();
  }

  @override
  void dispose() {
    _cocktailsStreamController.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 25, 39),
      body: CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(),
          _buildSliverCategoryList(),
          _buildSliverCocktailGrid(),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Color.fromARGB(255, 26, 25, 39),
      flexibleSpace: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 26, 25, 39),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    controller: _controller,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: 'What cocktail we are looking for?',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.white,
                  onPressed: () => setState(() => _controller.clear()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSliverCategoryList() {
    return SliverPadding(
      padding: EdgeInsets.all(5),
      sliver: SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.all(5),
          height: 45,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: CocktailCategory.values
                  .map(
                    (e) => Padding(
                      padding: EdgeInsets.all(3),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: (e.name == _chosenCategory.name)
                                ? Color.fromARGB(255, 59, 57, 83)
                                : Color.fromARGB(255, 32, 31, 44),
                            side: BorderSide(
                              width: 2.0,
                              color: Color.fromARGB(255, 45, 44, 57),
                            ),
                            shape: StadiumBorder()),
                        child: Text(
                          e.name,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            if(_chosenCategory != e) _chosenCategory = e;
                          });
                        },
                      ),
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }

  Widget _buildSliverCocktailGrid() {
    return StreamBuilder<Iterable<CocktailDefinition>>(
      stream: AsyncCocktailRepository()
          .fetchCocktailsByCocktailCategory(_chosenCategory)
          .asStream(),
      builder: (BuildContext context,
          AsyncSnapshot<Iterable<CocktailDefinition>> snapshot) {
        if (snapshot.hasError) {
          return SliverFillRemaining(
              child: Center(
            child: Text(
              snapshot.error.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ));
        }
        if (snapshot.hasData) {
          return SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return LayoutBuilder(
                    builder: (context, constraint) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                                snapshot.data.elementAt(index).drinkThumbUrl),
                          ),
                          Positioned(
                            bottom: 10,
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: constraint.minWidth),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data.elementAt(index).name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      padding: EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 8,
                                          bottom: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      //BoxDecoration
                                      child: Text(
                                        'id: ${snapshot.data.elementAt(index).id}',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }, childCount: snapshot.data.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1)),
          );
        }
        return SliverFillRemaining(
            child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: CircularProgressIndicator(),
            ),
            Text(
              'Search...',
              style: TextStyle(color: Colors.white),
            ),
          ]),
        ));
      },
    );
  }
}
