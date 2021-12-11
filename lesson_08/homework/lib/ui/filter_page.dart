// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'dart:async';

import 'package:cocktail/core/models.dart';
import 'package:cocktail/core/src/model/cocktail_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

StreamController _serverRepository =
    StreamController<Future<Iterable<CocktailDefinition>>>();
final AsyncCocktailRepository _repository = AsyncCocktailRepository();

class CocktailsFilterScreen extends StatefulWidget {
  @override
  State<CocktailsFilterScreen> createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _SearchField()),
        SliverToBoxAdapter(
            child: _CategoryList(
          categoryes: [
            CocktailCategory.punchPartyDrink,
            CocktailCategory.softDrinkSoda,
            CocktailCategory.shot,
            CocktailCategory.beer,
          ],
        )),
        _CoctailsListView(),
      ],
    ));
  }
}

class _SearchField extends StatefulWidget {
  const _SearchField({Key? key}) : super(key: key);

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(13, 40, 13, 0),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              SizedBox(
                  width: 300,
                  height: 30,
                  child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: _controller)),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatefulWidget {
  final List<CocktailCategory> categoryes;
  _CategoryList({Key? key, required this.categoryes}) : super(key: key);

  @override
  State<_CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<_CategoryList> {
  int active = 0;

  Function _selectCategory(int index) {
    return () {
      setState(() {
        active = index;
      });
    };
  }

  bool _checkActive(int index) {
    if (active == index) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: SizedBox(
        height: 46,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            if (widget.categoryes.isNotEmpty)
              ...widget.categoryes.map((element) => _CategoryButton(
                    category: element,
                    onTap: _selectCategory(widget.categoryes.indexOf(element)),
                    isActive: _checkActive(widget.categoryes.indexOf(element)),
                  )),
          ],
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final CocktailCategory category;
  final Function onTap;
  final bool isActive;
  _CategoryButton(
      {Key? key,
      required this.category,
      required this.onTap,
      required this.isActive})
      : super(key: key);

  void loadCategory() {
    _serverRepository
        .add(_repository.fetchCocktailsByCocktailCategory(category));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () {
          onTap();
          loadCategory();
        },
        child: SizedBox(
          height: 46,
          width: 103,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: isActive
                    ? Color.fromRGBO(184, 178, 212, 0.8)
                    : Color.fromRGBO(216, 214, 230, 0.5),
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.all(Radius.circular(22))),
            child: Center(child: Text(category.value.split('/').last)),
          ),
        ),
      ),
    );
  }
}

class _CoctailsListView extends StatelessWidget {
  const _CoctailsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: StreamBuilder(
          stream: _serverRepository.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshoot) {
            if (snapshoot.hasData)
              return FutureBuilder<Iterable<CocktailDefinition>>(
                future: snapshoot.data,
                builder: (BuildContext context,
                    AsyncSnapshot<Iterable<CocktailDefinition>> future) {
                  if (future.hasData)
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GridView.count(
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: [
                          ...future.data!.map(
                              (coctail) => _CoctailView(coctailDef: coctail))
                        ],
                      ),
                    );
                  return Center(child: Text('Wait !)'));
                },
              );
            return Center(
              child: Text('wait streem'),
            );
          }),
    );
  }
}

class _CoctailView extends StatelessWidget {
  final CocktailDefinition coctailDef;
  const _CoctailView({Key? key, required this.coctailDef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          coctailDef.drinkThumbUrl,
          errorBuilder: (context, error, stackTrace) {
            return Text('ops');
          },
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(coctailDef.name),
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(216, 214, 230, 1),
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('ID: ${coctailDef.id}'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
