import 'package:flutter/material.dart';

class SearchCoctailsGrid extends StatefulWidget {
  const SearchCoctailsGrid({Key? key}) : super(key: key);

  @override
  _SearchCoctailsGridState createState() => _SearchCoctailsGridState();
}

class _SearchCoctailsGridState extends State<SearchCoctailsGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        children: [
          CoctailGridItem(),
          CoctailGridItem(),
          CoctailGridItem(),
          CoctailGridItem(),
          CoctailGridItem(),
          CoctailGridItem(),
          CoctailGridItem(),
        ],
      ),
    );
  }
}

class CoctailGridItem extends StatelessWidget {
  const CoctailGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 215,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              'https://www.thecocktaildb.com/images/media/drink/qvprvp1483388104.jpg'),
        ),
      ),
      alignment: Alignment.bottomLeft,
      child: Container(
        //height: 90,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '«Арбузный» Мохито',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Container(
              margin: EdgeInsets.only(top: 6),
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF15151C),
                border: Border.all(
                  color: Color(0xFF211D22),
                ),
              ),
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'id:12345',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
