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
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Colors.white),
                    onPressed: () =>
                        Navigator.of(context).pop(),
                  ),
                  actions: [
                    Padding(
                        padding:
                            EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () => {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    content: Text('meow')))
                          },
                          child: Icon(CupertinoIcons.share),
                        ))
                  ],
                  expandedHeight: 300.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                          cocktail.drinkThumbUrl,
                          fit: BoxFit.cover)),
                ),
              ];
            },
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black87,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  _buildCoctailDetailsBlock(),
                  _buildCoctailIngridientsBlock(),
                  _buildInstructionsBlock()
                ],
              )),
            )));
  }

  Container _buildCoctailDetailsBlock() {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.grey,
      child: Stack(
        children: [
          Positioned(
              top: 32,
              left: 16,
              child: Text(
                cocktail.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          Positioned(
              top: 64,
              left: 16,
              child: Text(
                'id:' + cocktail.id,
                style: TextStyle(color: Colors.grey),
              )),
          Positioned(
              right: 32,
              top: 36,
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                  'assets/images/icon_hart.svg')),
          _getCoctailDescriptionWidget(
              96,
              'Категория коктейля',
              cocktail.category.value),
          _getCoctailDescriptionWidget(160, 'Тип коктейля',
              cocktail.cocktailType.value),
          _getCoctailDescriptionWidget(
              224, 'Тип стекла', cocktail.glassType.value)
        ],
      ),
    );
  }

  Widget _getCoctailDescriptionWidget(
      double marginTop, String title, String description) {
    return Positioned(
        left: 16,
        top: marginTop,
        child: Stack(children: [
          Text(title,
              style: TextStyle(color: Colors.green)),
          Container(
              padding: EdgeInsets.only(left: 16, top: 24),
              child: Text(
                description,
                style: TextStyle(color: Colors.red),
              ))
        ]));
  }

  Widget _buildCoctailIngridientsBlock() {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 24),
              child: Align(
                child: Text(
                  'Ингридиенты:',
                  style: TextStyle(color: Colors.purple),
                ),
                alignment: Alignment.center,
              )),
          _buildIngridientsTable(),
        ],
      ),
    );
  }

  Widget _buildIngridientsTable() {
    var meow = <TableRow>[];
    cocktail.ingredients.forEach((ingridient) {
      meow.add(TableRow(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(ingridient.ingredientName,
                    style: TextStyle(
                        color: Colors.white,
                        decoration:
                            TextDecoration.underline)),
              )),
          Padding(
              padding: EdgeInsets.only(top: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(ingridient.measure,
                    style: TextStyle(color: Colors.white)),
              )),
        ],
      ));
    });

    var ingridientsTable = Table(children: meow);

    return Padding(
        child: ingridientsTable,
        padding: EdgeInsets.fromLTRB(16, 48, 16, 24));
  }

  Widget _buildInstructionsBlock() {
    return Container(
        width: double.infinity,
        color: Colors.grey,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24, left: 24),
              child: Text(
                'Инструкция для приготовления',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.fromLTRB(16, 65, 20, 20),
                child: _buildInstructionList())
          ],
        ));
  }

  Widget _buildInstructionList() {
    var newInstructions = <String>[];
    cocktail.instruction
        .split('-')
        .skipWhile((value) => value.isEmpty)
        .forEach((element) {
      newInstructions.add('\u2022 ' + element.trim());
    });

    var widgetInstructions = <Widget>[];

    newInstructions.forEach((element) {
      widgetInstructions.add(Text(
        element,
        style: TextStyle(color: Colors.green),
      ));
    });

    return Container(
      height: 180,
      width: double.infinity,
      child: ListView.separated(
          itemCount: newInstructions.length,
          padding: const EdgeInsets.all(0.0),
          separatorBuilder:
              (BuildContext context, int index) {
            return SizedBox(height: 16);
          },
          itemBuilder: (BuildContext context, int index) {
            return Text(
              newInstructions.elementAt(index),
              style: TextStyle(color: Colors.white),
            );
          }),
    );
  }
}
