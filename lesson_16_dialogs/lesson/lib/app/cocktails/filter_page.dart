// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson/app/core/src/model/cocktail_category.dart';
import 'package:lesson/app/core/src/model/cocktail_definition.dart';
import 'package:lesson/app/core/src/repository/async_cocktail_repository.dart';

import '../coctail_detail_page.dart';
import 'cocktail_grid_item.dart';
import 'coctail_detail_dialog.dart';
import 'fitler_bar.dart';

class CocktailsFilterScreen extends StatefulWidget {
  const CocktailsFilterScreen(
    this.repository, {
    Key? key,
  }) : super(key: key);

  final AsyncCocktailRepository repository;

  @override
  _CocktailsFilterScreenState createState() => _CocktailsFilterScreenState();
}

class _CocktailsFilterScreenState extends State<CocktailsFilterScreen> {
  final _categoryNotifier =
      ValueNotifier<CocktailCategory>(CocktailCategory.values.first);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: _categoryNotifier,
          builder: (ctx, value, child) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 21)),
                SliverPersistentHeader(
                  delegate: CategoriesFilterBarDelegate(
                    CocktailCategory.values,
                    onCategorySelected: (category) {
                      _categoryNotifier.value = category;
                    },
                    selectedCategory: _categoryNotifier.value,
                  ),
                  floating: true,
                ),
                SliverToBoxAdapter(child: SizedBox(height: 24)),
                _buildCocktailItems(context)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCocktailItems(BuildContext context) {
    return FutureBuilder<Iterable<CocktailDefinition>>(
        future: widget.repository
            .fetchCocktailsByCocktailCategory(_categoryNotifier.value),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return SliverFillRemaining(
                child: Center(child: Text(snapshot.error.toString())));
          }

          if (snapshot.hasData) {
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        _showDetailPage(
                            context, snapshot.data!.elementAt(index));
                      },
                      onLongPress: () {
                        _showPopupDetails(
                            context, snapshot.data!.elementAt(index));
                      },
                      child: CocktailGridItem(snapshot.data!.elementAt(index),
                          selectedCategory: _categoryNotifier.value),
                    );
                  }, childCount: snapshot.data!.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: CocktailGridItem.aspectRatio,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      crossAxisCount: 2)),
            );
          }

          //todo set loader
          return SliverFillRemaining(child: const SizedBox());
        });
  }

  //variant 1
  //Пример как можно создать подобие диалогового окна,
  //используя PageRouteBuilder
  // void _showPopupDetails(
  //     BuildContext context, CocktailDefinition cocktailDefinition) {
  //   Navigator.of(context).push(PageRouteBuilder(
  //       opaque: false,
  //       barrierDismissible: true,
  //       barrierLabel: 'l',
  //       barrierColor: Colors.black45,
  //       fullscreenDialog: true,
  //       pageBuilder: (context, a, sa) {
  //         return Center(
  //           child: CocktailDetailDialog(cocktailDefinition),
  //         );
  //       }));
  // }

  //variant 2
  void _showPopupDetails(
      BuildContext context, CocktailDefinition cocktailDefinition) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: 'l',
        barrierColor: Colors.black45,
        pageBuilder: (context, a, sa) {
          return Center(child: CocktailDetailDialog(cocktailDefinition));
        });
  }

  void _showDetailPage(
      BuildContext context, CocktailDefinition cocktailDefinition) {
    Navigator.of(context).push(RawDialogRoute(pageBuilder: (context,a,d) {
      return CocktailDetailPage(cocktailDefinition);
    }));
  }
}
