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
    return SingleChildScrollView(
      child: Column(children: [
        _Banner(
          srcImage: cocktail.drinkThumbUrl,
        ),
        _CoctailInfo(
          category: cocktail.category,
          glassType: cocktail.glassType,
          id: cocktail.id,
          name: cocktail.name,
          coctailType: cocktail.cocktailType,
        ),
        _Ingredients(
          ingredients: [
            ...cocktail.ingredients
            // IngredientDefinition('Листья мяты', '4 шт'),
            // IngredientDefinition('Лайм', '½ шт'),
            // IngredientDefinition('Сахар', '1 ст. ложка'),
            // IngredientDefinition('Белый ром', '60 мл'),
            // IngredientDefinition('Лед', '½ стакана'),
            // IngredientDefinition('Мякоть арбуза', '120 г'),
          ],
        ),
        _Instruction(
          instruction: cocktail.instruction,
        ),
        _Rate()
      ]),
    );
  }
}

class _Banner extends StatelessWidget {
  _Banner({Key key, String this.srcImage}) : super(key: key);
//TODO svg problem
  // final Widget svg = SvgPicture.asset('assets/images/coctail.svg');
  final Widget iconBack = SvgPicture.asset('assets/images/icon_back.svg');
  final Widget iconOut = SvgPicture.asset('assets/images/icon_out.svg');
  final srcImage;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(srcImage))),
        height: 343,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 58, 19, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: iconBack),
              IconButton(onPressed: () {}, icon: iconOut),
            ],
          ),
        ));
  }
}

class _CoctailInfo extends StatelessWidget {
  _CoctailInfo({
    Key key,
    this.name,
    this.id,
    this.category,
    this.glassType,
    this.coctailType,
  }) : super(key: key);

  final String name;
  final String id;
  final CocktailCategory category;
  final GlassType glassType;
  final CocktailType coctailType;

  final Widget _iconHart = SvgPicture.asset('assets/images/icon_hart.svg');

  static Widget _buildMainInfo({String title, String text}) {
    final TextStyle style = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 15,
      fontWeight: FontWeight.w400,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 11, 0, 11),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: style),
        Padding(
          padding: const EdgeInsets.only(top: 14.0, left: 16.0),
          child: Text(text, style: style),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 322,
        //TODO colors to argb
        child: ColoredBox(
          color: Color.fromRGBO(229, 227, 241, 0.8),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 34, 32, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(name,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    IconButton(icon: _iconHart, onPressed: () {})
                  ],
                ),
                Text(
                  id,
                  style: TextStyle(color: Color.fromRGBO(132, 131, 150, 1)),
                ),
                _buildMainInfo(
                    title: 'Категория коктейля', text: category.value),
                _buildMainInfo(title: 'Тип коктейля', text: coctailType.value),
                _buildMainInfo(
                  title: 'Тип стекла',
                  text: glassType.value,
                ),
              ],
            ),
          ),
        ));
  }
}

class _Ingredients extends StatelessWidget {
  const _Ingredients({Key key, Iterable<IngredientDefinition> this.ingredients})
      : super(key: key);

  final Iterable<IngredientDefinition> ingredients;

  static _title() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        'Ингредиенты:',
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static _buildIngredient({String ingredient, String mesure}) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ingredient,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            mesure,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 200),
      child: SizedBox(
        width: double.infinity,
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 24, 36, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _title(),
                ...ingredients.map((IngredientDefinition element) =>
                    _buildIngredient(
                        ingredient: element.ingredientName,
                        mesure: element.measure))
                // _buildIngredient(ingredient: 'Листья мяты', mesure: '4 шт'),
                // _buildIngredient(ingredient: 'Лайм', mesure: '½ шт'),
                // _buildIngredient(ingredient: 'Сахар', mesure: '1 ст. ложка'),
                // _buildIngredient(ingredient: 'Белый ром', mesure: '60 мл'),
                // _buildIngredient(ingredient: 'Лед', mesure: '½ стакана'),
                // _buildIngredient(ingredient: 'Мякоть арбуза', mesure: '120 г'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Instruction extends StatelessWidget {
  const _Instruction({Key key, String this.instruction}) : super(key: key);

  final String instruction;

  static _title(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static _description(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 274,
      child: ColoredBox(
        color: Color.fromRGBO(216, 214, 230, 1),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 23, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title('Инструкция для приготовления'),
                _description(instruction)
              ],
            )),
      ),
    );
  }
}

class _Rate extends StatelessWidget {
  const _Rate({Key key}) : super(key: key);

  static Widget _buildStar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: Color.fromRGBO(204, 200, 222, 1),
        width: 48,
        height: 48,
        child: Icon(
          Icons.star_outlined,
          size: 32,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 113,
      width: double.infinity,
      child: ColoredBox(
          color: Color.fromRGBO(223, 219, 239, 1),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.filled(5, _buildStar()),
            ),
          )),
    );
  }
}
