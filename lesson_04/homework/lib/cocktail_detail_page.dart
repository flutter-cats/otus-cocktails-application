import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  get child => null;

  @override
  Widget build(BuildContext context) {
    /// TODO: Сделать верстку экрана "Карточка коктейля" по модели Cocktail cocktail
    /// Ссылка на макет
    /// https://www.figma.com/file/d2JJUBFu7Dg0HOV30XG7Z4/OTUS-FLUTTER.-%D0%A3%D1%80%D0%BE%D0%BA-3-%D0%94%D0%97?node-id=23%3A85
    ///для того чтобы весь контент поместился, необходимо использовать SingleChildScrollView()
    ///
    ///
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 365,
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset("assets/images/foto_mohito.png").image,
                    fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: SvgPicture.asset("assets/images/icon_back.svg"),
                        color: Colors.white,
                        onPressed: () {}),
                    IconButton(
                        icon: SvgPicture.asset("assets/images/icon_out.svg"),
                        color: Colors.white,
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
            Container(
                color: HexColor("#1A1927"),
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          cocktail.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            icon:
                                SvgPicture.asset("assets/images/icon_hart.svg"),
                            color: Colors.white,
                            onPressed: () {}),
                      ],
                    ),
                    Container(
                      width: 800,
                      child: Text(
                        cocktail.id,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: HexColor("#848396"),
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: 800,
                      padding: EdgeInsets.only(
                          top: 20, bottom: 0, left: 0, right: 0),
                      child: Text(
                        'Категория коктейля',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: HexColor("#EAEAEA"),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: 800,
                      padding: EdgeInsets.only(
                          top: 14, bottom: 0, left: 16, right: 0),
                      child: Text(
                        'Coctail',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: HexColor("#ffffff"),
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: 800,
                      padding: EdgeInsets.only(
                          top: 20, bottom: 0, left: 0, right: 0),
                      child: Text(
                        'Тип коктейля',
                        //textAlign: TextAlign.left,
                        style: TextStyle(
                            color: HexColor("#EAEAEA"),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: 800,
                      padding: EdgeInsets.only(
                          top: 14, bottom: 0, left: 16, right: 0),
                      child: Text(
                        'Алкогольный',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: HexColor("#ffffff"),
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: 800,
                      padding: EdgeInsets.only(
                          top: 20, bottom: 0, left: 0, right: 0),
                      child: Text(
                        'Тип стекла',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: HexColor("#EAEAEA"),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      width: 800,
                      padding: EdgeInsets.only(
                          top: 14, bottom: 0, left: 16, right: 0),
                      child: Text(
                        'Хайбол',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: HexColor("#ffffff"),
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                )),
            Container(
                height: 273,
                width: 800,
                color: HexColor("#000000"),
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Ингредиенты:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: HexColor('#B1AFC6'),
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Листья мяты',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                              color: HexColor('#ffffff'),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '4 шт',
                          style: TextStyle(
                              color: HexColor('#ffffff'),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Лайм',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                              color: HexColor('#ffffff'),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '1/2 шт',
                          style: TextStyle(
                              color: HexColor('#ffffff'),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Сахар',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                              color: HexColor('#ffffff'),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '1 ст. ложка',
                          style: TextStyle(
                              color: HexColor('#ffffff'),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Белый ром',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                              color: HexColor('#ffffff'),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '60 мл',
                          style: TextStyle(
                              color: HexColor('#ffffff'),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Лед',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                              color: HexColor('#ffffff'),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '1/2 стакана',
                          style: TextStyle(
                              color: HexColor('#ffffff'),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Мякоть арбуза',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                              color: HexColor('#ffffff'),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '120 г',
                          style: TextStyle(
                              color: HexColor('#ffffff'),
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ],
                )),
            Container(
                height: 273,
                width: 800,
                color: HexColor("#1A1927"),
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Инструкции для приготовления',
                        style: TextStyle(
                            color: HexColor('#ffffff'),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 14, bottom: 0, left: 0, right: 0),
                      child: Text(
                          "\u2022 В большом бокале смешайте порванные листья мяты, разрезанный на кусочки лайм и сахар. Толкушкой хорошо раздавите, чтобы лайм пустил сок.",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          softWrap: true),
                    ),
                    Container(
                      child: Text(
                          "\u2022 Добавьте мелко нарезанную кубиками мякоть арбуза и снова слегка растолките.",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          softWrap: true),
                    ),
                    Container(
                      child: Text(
                          "\u2022 Добавьте ром и лед. Перемешайте и разлейте по бокалам. Сразу подавайте.",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          softWrap: true),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(top: 24, bottom: 0, left: 0, right: 0),
              color: HexColor("#000000"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: HexColor('#2A293A'),
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: HexColor('#2A293A'),
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: HexColor('#2A293A'),
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: HexColor('#2A293A'),
                    child: Icon(
                      Icons.star,
                      color: HexColor('#1A1927'),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: HexColor('#2A293A'),
                    child: Icon(
                      Icons.star,
                      color: HexColor('#1A1927'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
