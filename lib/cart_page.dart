import 'package:flutter/material.dart';
import 'cart_product.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardTitle = Container(
    width: double.infinity,
    height: 75,
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05
            ),
            child: Icon(Icons.arrow_back),
          ),
          Container(
            child: Text('My cart',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.05
            ),
            width: 50,
            height: 50,
            child: Image(image: AssetImage('assets/img/logo_floraplant.png'),),
          ),
        ],
      ),
    )
  );
    final cardCheck = Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: double.infinity,
        height: 150,
        child: Card(
          child: Row(
            children: [
              Text('Total',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                )
              ),
            ]
          ),
        ),
      ),
    );

    return Container(
      child:
        Column(
        children: [
          cardTitle,
          CartProduct('assets/img/exampleplant.png', 'Atlantic Burgundy', 75),
          CartProduct('assets/img/exampleplant.png', 'Atlantic Burgundy', 75),
          CartProduct('assets/img/exampleplant.png', 'Atlantic Burgundy', 75),
          CartProduct('assets/img/exampleplant.png', 'Atlantic Burgundy', 75),
          cardCheck,
        ],
      ),
    );
  }
  
}