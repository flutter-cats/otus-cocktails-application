import 'package:flutter/material.dart';
import 'package:cocktails_mobx/app/ui/filter/filter_page.dart';

import 'favorites/favorites_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  final _pages = [CocktailsFilterScreenCustomBlocStyle(), FavoritesPage()];

  final _tabs = [
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
    BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Избранное'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Т.к state хранится внутри bloc
      // то pages будет сохранять необходимые данные
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _tabs,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
