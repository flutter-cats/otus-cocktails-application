import 'package:flutter/material.dart';

//TODO: реализовать hero анимацию при выборе элемента

final urls = [
  'https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg',
  'https://www.thecocktaildb.com/images/media/drink/xtuyqv1472669026.jpg',
  'https://www.thecocktaildb.com/images/media/drink/wwpyvr1461919316.jpg',
  'https://www.thecocktaildb.com/images/media/drink/ywxwqs1461867097.jpg',
  'https://www.thecocktaildb.com/images/media/drink/vqyxqx1472669095.jpg',
  'https://www.thecocktaildb.com/images/media/drink/trptts1454514474.jpg',
  'https://www.thecocktaildb.com/images/media/drink/ssxvww1472669166.jpg',
  'https://www.thecocktaildb.com/images/media/drink/ysqvqp1461867292.jpg',
];

void main() {
  runApp(MaterialApp(
    home: RootHeroScreen(),
  ));
}

class RootHeroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RootScreen'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: urls.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (_) {
                        return DetailPage(urls.elementAt(index));
                      }));
                },
                //TODO: реализовать hero
                child: Image.network(urls.elementAt(index)));
          }),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String url;

  const DetailPage(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //TODO: реализовать hero
      body: Center(
        child: Image.network(url),
      ),
    );
  }
}
