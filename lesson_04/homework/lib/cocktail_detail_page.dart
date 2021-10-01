import 'package:flutter/cupertino.dart';
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
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () => {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('meow')))
                    },
                    child: Icon(CupertinoIcons.share),
                  ))
            ],
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                background:
                    Image.network(cocktail.drinkThumbUrl, fit: BoxFit.cover)),
          ),
        ];
      },
      body: Column(
        children: [_buildCoctailDetails()],
      ),
    ));
  }

  Container _buildCoctailDetails() {
    return Container(
      width: double.infinity,
      height: 322,
      color: Colors.black87,
      child: Stack(
        children: [
          Positioned(
              top: 16,
              left: 16,
              child: Text(
                cocktail.name,
                style: TextStyle(color: Colors.green),
              )),
          Positioned(
              top: 40,
              left: 16,
              child: Text(
                'id:' + cocktail.id,
                style: TextStyle(color: Colors.grey),
              )),
          Positioned(
              right: 16,
              top: 16,
              width: 38,
              height: 34,
              child: SvgPicture.asset('assets/images/icon_hart.svg')),
          _getCoctailDescriptionWidget(
              104, 'Категория коктейля', cocktail.category.value),
          _getCoctailDescriptionWidget(
              176, 'Тип коктейля', cocktail.cocktailType.value),
          _getCoctailDescriptionWidget(
              240, 'Тип стекла', cocktail.glassType.value)
        ],
      ),
    );
  }

  Widget _getCoctailDescriptionWidget(double marginTop, String title, String description) {
    return Positioned(
        left: 16,
        top: marginTop,
        child: Stack(children: [
          Text(title, style: TextStyle(color: Colors.green)),
          Container(
              padding: EdgeInsets.only(left: 16, top: 24),
              child: Text(
                description,
                style: TextStyle(color: Colors.red),
              ))
        ]));
  }
}
