Skip to content
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 
@IriEfremova 
IriEfremova
/
otus-cocktails-application
forked from flutter-cats/otus-cocktails-application
0
0
5
Code
Pull requests
Actions
Projects
Wiki
Security
Insights
Settings
otus-cocktails-application/lesson_04/homework/lib/cocktail_detail_page.dart
@sna2021
sna2021 Lesson 04 (flutter-cats#6)
…
Latest commit 74022dc on 15 Mar
 History
 1 contributor
22 lines (19 sloc)  827 Bytes
  
import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
      this.cocktail, {
        Key key,
      }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    /// TODO: Сделать верстку экрана "Карточка коктейля" по модели Cocktail cocktail
    /// Ссылка на макет
    /// https://www.figma.com/file/d2JJUBFu7Dg0HOV30XG7Z4/OTUS-FLUTTER.-%D0%A3%D1%80%D0%BE%D0%BA-3-%D0%94%D0%97?node-id=23%3A85
    ///для того чтобы весь контент поместился, необходимо использовать SingleChildScrollView()
    ///
    ///
  }
}
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
