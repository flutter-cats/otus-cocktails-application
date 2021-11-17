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
    final topImage = Image.asset(
      "assets/images/Rectangle 7.png",
      width: double.infinity,
      fit: BoxFit.fill,
    );

    Widget cocktailInfo(){
      Widget cocktailType(String text, String type){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text,style: TextStyle(color: Color(0xFFEAEAEA),fontSize: 14)),
              SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 18),
                child: Text(type, style: TextStyle(color: Color(0xFFEAEAEA),fontSize: 15)),
                decoration: BoxDecoration(
                    color: Color(0xFF15151C),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))
                ),
              )
            ],
          ),
        );
      }
      return Container(
        width: double.infinity,
        color: Color(0xFF1A1927),
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Арбузный мохито",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 24)),
                SvgPicture.asset("assets/images/icon_hart.svg",color: Color(0xFFEAEAEA),)
              ],
            ),
            SizedBox(height: 10),
            Text("id:12864",style: TextStyle(color: Color(0xFF848396),fontSize: 13),),
            SizedBox(height: 10),
            cocktailType("Категория коктеля", "Cocktail"),
            cocktailType("Тип коктеля", "Алкогольный"),
            cocktailType("Тип стекла", "Хайбол"),
          ],
        ),
      );
    }

    Widget ingredients(){
      Widget ingredient(String name, String number){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,style: TextStyle(color: Color(0xFFEAEAEA),fontSize: 14,decoration: TextDecoration.underline,)),
              Text(number, style: TextStyle(color: Color(0xFFEAEAEA),fontSize: 14)),
            ],
          ),
        );
      }
      return Container(
        width: double.infinity,
        color: Color(0xFF000000),
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ингридиенты:",style: TextStyle(color: Color(0xFFB1AFC6),fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            ingredient("Листья мяты","4 шт"),
            ingredient("Лайм","½ шт"),
            ingredient("Сахар","1 ст. ложка"),
            ingredient("Белый ром","60 мл"),
            ingredient("Лед","½ стакана"),
            ingredient("Мякоть арбуза","120 г"),
          ],
        ),
      );
    }

    Widget cookingInstruction(){
      Widget paragraph(String text){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text("• " + text,style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 14)),
        );
      }
      return Container(
        width: double.infinity,
        color: Color(0xFF201F2C),
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Инструкция для приготовления:",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 16)),
            SizedBox(height: 10),
            paragraph('В большом бокале смешайте порванные листья мяты, '
                'разрезанный на кусочки лайм и сахар. Толкушкой хорошо раздавите, '
                'чтобылайм пустил сок.'),
            paragraph('Добавьте мелко нарезанную кубиками мякоть '
                'арбуза и снова слегка растолките.'),
            paragraph('Добавьте ром и лед. Перемешайте и разлейте '
                'по бокалам. Сразу подавайте.')
          ],
        ),
      );
    }

    Widget bottom(){
      Widget star(Color color){
        return Container(
          child: Icon(Icons.star,size: 32,color: color,),
          height: 48,
          width: 48,
          decoration: BoxDecoration(
              color: Color(0xFF2A293A),
              borderRadius: BorderRadius.all(Radius.circular(50.0))
          ),
        );
      }
      return Container(
        color: Color(0xFF1A1927),
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              star(Color(0xFFFFFFFF)),
              star(Color(0xFFFFFFFF)),
              star(Color(0xFFFFFFFF)),
              star(Color(0xFF1A1927)),
              star(Color(0xFF1A1927))
            ],
          ),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/images/icon_out.svg"))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            topImage,
            cocktailInfo(),
            ingredients(),
            cookingInstruction(),
            bottom()
          ],
        ),
      ),
    );


    /// TODO: Сделать верстку экрана "Карточка коктейля" по модели Cocktail cocktail
    /// Ссылка на макет
    /// https://www.figma.com/file/d2JJUBFu7Dg0HOV30XG7Z4/OTUS-FLUTTER.-%D0%A3%D1%80%D0%BE%D0%BA-3-%D0%94%D0%97?node-id=23%3A85
    ///для того чтобы весь контент поместился, необходимо использовать SingleChildScrollView()
    ///
    ///
  }
}
