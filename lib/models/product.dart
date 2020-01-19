import 'package:flutter/material.dart';
import 'package:yala_mazad/models/single_product.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var productList = [
    {
      "name": "Dhan",
      "picture": "img/crop1.jpeg",
      "old price": 120,
      "price": 85.99
    },
    {
      "name": "baazra",
      "picture": "img/crop2.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Makka",
      "picture": "img/crop3.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Sugercane",
      "picture": "img/crop4.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Dhaniya",
      "picture": "img/crop5.jpeg",
      "old price": 120,
      "price": 85.99
    },
    {
      "name": "Jwar",
      "picture": "img/crop6.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Hills",
      "picture": "img/crop1.jpeg",
      "old price": 120,
      "price": 85
    },
    {
      "name": "Wheat",
      "picture": "img/crop2.jpeg",
      "old price": 120,
      "price": 85
    },
    {"name": "new", "picture": "img/crop3.jpeg", "old price": 120, "price": 85},
    {"name": "new", "picture": "img/crop4.jpeg", "old price": 120, "price": 85},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldPrice: productList[index]['old price'],
            productPrice: productList[index]['price'],
          );
        });
  }
}
