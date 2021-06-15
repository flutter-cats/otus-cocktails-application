import 'package:flutter/material.dart';
import 'package:homework/ui/style/colors.dart';
import '../../../core/models.dart';

class CoctailDetailsIngridients extends StatelessWidget {
  final Iterable<IngredientDefinition> ingridens;

  const CoctailDetailsIngridients({required this.ingridens});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 30),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                "Ингредиенты:",
                style: TextStyle(color: CustomColors.headline6),
              ),
            ),
            ...ingridens.map((ingr) => CoctailIngridient(ingr))
          ],
        ));
  }
}

class CoctailIngridient extends StatelessWidget {
  final IngredientDefinition ingridient;

  CoctailIngridient(this.ingridient);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              ingridient.ingredientName,
              style: TextStyle(
                  color: Colors.white, decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(ingridient.measure, style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
