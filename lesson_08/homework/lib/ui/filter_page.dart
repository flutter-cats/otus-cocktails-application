// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:cocktail/constants.dart';
import 'package:cocktail/core/models.dart';
import 'package:cocktail/ui/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CocktailsFilterScreen extends StatefulWidget {
  @override
  State<CocktailsFilterScreen> createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  CocktailCategory selectedCategory = CocktailCategory.ordinaryDrink;

  Future<Iterable<CocktailDefinition>> getCoctails() async {
    return AsyncCocktailRepository().fetchCocktailsByCocktailCategory(selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                kBackgraundColorLight,
                kBackgraundColorDark,
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              _search(),
              _filterList(),
              Expanded(
                child: FutureBuilder(
                  future: getCoctails(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return CustomScrollView(
                          slivers: <Widget>[
                            SliverPadding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 27.0,
                              ),
                              sliver: SliverGrid(
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return SnapshotItem(
                                      cocktail: snapshot.data[index],
                                    );
                                  },
                                  childCount: snapshot.data.length,
                                ),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5.0,
                                  mainAxisSpacing: 5.0,
                                ),
                              ),
                            )
                          ],
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text400(
                            'Сообщение об ошибке',
                            fontSize: 14.0,
                          ),
                        );
                      }
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/shaker_icon.svg',
                          fit: BoxFit.scaleDown,
                          width: 36.0,
                          height: 36.0,
                        ),
                        SizedBox(
                          height: 8.91,
                        ),
                        Text400(
                          'Поиск...',
                          fontSize: 14.0,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _filterList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: SizedBox(
        width: double.infinity,
        height: 46.0,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 13.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: CocktailCategory.values.length,
          separatorBuilder: (context, index) => SizedBox(width: 10.0),
          itemBuilder: (BuildContext context, int index) {
            return FilterChip(
              text: CocktailCategory.values.elementAt(index).value,
              isActive: selectedCategory == CocktailCategory.values.elementAt(index),
              onTap: () {
                setState(() {
                  selectedCategory = CocktailCategory.values.elementAt(index);
                });
              },
            );
          },
        ),
      ),
    );
  }

  Widget _search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: SearchTextField(),
    );
  }
}

class SnapshotItem extends StatelessWidget {
  const SnapshotItem({
    Key? key,
    required this.cocktail,
  }) : super(key: key);
  final CocktailDefinition cocktail;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (rect) => LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(rect),
            blendMode: BlendMode.darken,
            child: Image.network(cocktail.drinkThumbUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text500(
                  cocktail.name,
                  fontSize: 14.0,
                  maxLines: 4,
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  height: 24.0,
                  decoration: BoxDecoration(
                    color: kDisabledColor,
                    border: Border.all(color: kBorderChipColor),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 6.0,
                    ),
                    child: Text400('id:${cocktail.id}', fontSize: 10.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        style: kTextStyle500.copyWith(
          color: kWhiteColor,
          fontSize: 13.0,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kBorderTextFieldColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(65.0)),
          ),
          prefixIcon: SvgPicture.asset(
            'assets/search_icon.svg',
            width: 20.31,
            height: 20.31,
            fit: BoxFit.scaleDown,
          ),
          suffixIcon: SvgPicture.asset(
            'assets/close_icon.svg',
            width: 7.71,
            height: 7.71,
            fit: BoxFit.scaleDown,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kBorderTextFieldColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(65.0)),
          ),
        ),
      ),
    );
  }
}

class FilterChip extends StatelessWidget {
  const FilterChip({Key? key, required this.text, required this.isActive, required this.onTap})
      : super(key: key);
  final String text;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 46.0,
        decoration: BoxDecoration(
          color: isActive ? kEnabledColor : kDisabledColor,
          border: Border.all(
            color: kBorderChipColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 14.0,
          ),
          child: Text400(text, fontSize: 15.0),
        )),
      ),
    );
  }
}
