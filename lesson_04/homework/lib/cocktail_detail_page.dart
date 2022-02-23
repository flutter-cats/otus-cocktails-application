import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String fontFamily = 'SF Pro Text';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildImageContainer(),
                _buildDescriptionContainer(),
                _buildIngredientsContainer(),
                _buildInstructionContainer(),
                _buildRowRating(3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Stack(
      children: <Widget>[
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center)
              .createShader(rect),
          blendMode: BlendMode.darken,
          child: Image.network(
            cocktail.drinkThumbUrl,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return SizedBox(
                  height: 343.0,
                  child: Center(child: CircularProgressIndicator()));
            },
            errorBuilder:
                (BuildContext context, Object error, StackTrace stackTrace) {
              return SizedBox(
                height: 343.0,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 19.0,
            left: 28.0,
            right: 19.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomIconButton(
                onTap: () {},
                image: SvgPicture.asset(
                  'assets/images/icon_back.svg',
                  height: 15.56,
                  width: 16.0,
                ),
              ),
              CustomIconButton(
                onTap: () {},
                image: SvgPicture.asset(
                  'assets/images/icon_out.svg',
                  height: 18.0,
                  width: 18.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRowRating(int rating) {
    return Container(
      width: double.infinity,
      color: Color(0xFF1A1927),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 35.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            for (var i = 0; i < 5; i++)
              StarContainer(flag: i + 1 <= rating ? true : false)
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionContainer() {
    var steps = cocktail.instruction.replaceAll('- ', '\u2022').split('\n');

    return Container(
      color: Color(0xFF201F2C),
      child: Padding(
        padding: EdgeInsets.only(
          top: 24.0,
          bottom: 40.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Инструкция для приготовления',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: fontFamily,
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            for (var item in steps)
              if (item == steps.last)
                Text(
                  item,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                    fontFamily: fontFamily,
                  ),
                )
              else
                Column(
                  children: <Widget>[
                    Text(
                      item,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                        fontFamily: fontFamily,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientsContainer() {
    return Padding(
      padding: EdgeInsets.only(
        top: 24.0,
        left: 32.0,
        right: 36.0,
        bottom: 24.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Ингредиенты:',
            style: TextStyle(
              color: Color(0xFFB1AFC6),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              fontFamily: fontFamily,
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          for (var item in cocktail.ingredients)
            if (item == cocktail.ingredients.last)
              _buildRowIngredient(item.ingredientName, item.measure)
            else
              Column(
                children: <Widget>[
                  _buildRowIngredient(item.ingredientName, item.measure),
                  SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
        ],
      ),
    );
  }

  Row _buildRowIngredient(String name, String count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14.0,
            fontFamily: fontFamily,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.underline,
          ),
        ),
        Text(
          count,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: fontFamily,
              fontSize: 14.0,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildCategory(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Color(0xFFEAEAEA),
            fontWeight: FontWeight.normal,
            fontSize: 14.0,
            fontFamily: fontFamily,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        CategoryContainer(
          text: text,
        ),
      ],
    );
  }

  Widget _buildDescriptionContainer() {
    return Container(
      color: Color(0xFF1A1927),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 33.0,
          left: 32.0,
          right: 34.0,
          bottom: 18.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  cocktail.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: fontFamily,
                  ),
                ),
                FavouriteIconButton(
                  isFavourite: cocktail.isFavourite,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Id:${cocktail.id}',
              style: TextStyle(
                color: Color(0xFF848396),
                fontSize: 13.0,
                fontWeight: FontWeight.normal,
                fontFamily: fontFamily,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            _buildCategory('Категория котейля', cocktail.category.value),
            SizedBox(
              height: 18.0,
            ),
            _buildCategory('Тип коктейля', cocktail.cocktailType.value),
            SizedBox(
              height: 18.0,
            ),
            _buildCategory('Тип стекла', cocktail.glassType.value),
          ],
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key key, this.onTap, this.image}) : super(key: key);

  final void Function() onTap;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Center(
          child: image,
        ),
      ),
    );
  }
}

class StarContainer extends StatelessWidget {
  const StarContainer({
    Key key,
    this.flag,
  }) : super(key: key);
  final bool flag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      width: 48.0,
      decoration: BoxDecoration(
        color: Color(0xFF2A293A),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          Icons.star,
          size: 32.0,
          color: flag ? Color(0xFFFFFFFF) : Color(0xFF1A1927),
        ),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({Key key, this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF15151C),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 6.0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: fontFamily,
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({Key key, this.isFavourite}) : super(key: key);
  final bool isFavourite;

  @override
  _FavouriteIconButtonState createState() => _FavouriteIconButtonState();
}

class _FavouriteIconButtonState extends State<FavouriteIconButton> {
  bool isFavourite;
  @override
  void initState() {
    isFavourite = widget.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavourite = !isFavourite;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          'assets/images/icon_hart.svg',
          color: isFavourite ? Colors.red : Colors.white,
        ),
      ),
    );
  }
}
