import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildProductItem,
      itemCount: products.length,
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 8, top: 4),
      elevation: 4,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset('assets/images/macbook.jpg', width: 400),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              products[index],
              style: TextStyle(color: Colors.deepPurple),
            ),
          )
        ],
      ),
    );
  }
}
