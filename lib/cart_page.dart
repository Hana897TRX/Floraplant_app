import 'package:floramundo_app/utils/shared_preferences_cart.dart';
import 'package:flutter/material.dart';
import 'cart_product.dart';

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<Cart> {
  List<String> _products = [];
  List<String> _cantidads = [];
  @override
  void initState() {
    super.initState();
    List<String> guardados = ["Orquidea", "Maceta", "Girasol", "Papaya"];
    List<String> cantidades = ["1", "89", "100", "5"];
    CartSharedPreferences.setProductos(guardados);
    CartSharedPreferences.setCantidades(cantidades);
    _products = CartSharedPreferences.getProductos() ?? [];
    _cantidads = CartSharedPreferences.getCantidades() ?? [];
  }

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
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Icon(Icons.arrow_back),
              ),
              Container(
                child: Text(
                  'My cart',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05),
                width: 50,
                height: 50,
                child: Image(
                  image: AssetImage('assets/img/logo_floraplant.png'),
                ),
              ),
            ],
          ),
        ));
    final cardCheck = Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: double.infinity,
        height: 150,
        child: Card(
          child: Row(children: [
            Text('Total',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                )),
          ]),
        ),
      ),
    );

    return Container(
      child: Column(
        children: [
          cardTitle,
          CartProduct('assets/img/exampleplant.png', _products[0],
              double.parse(_cantidads[0])),
          CartProduct('assets/img/exampleplant.png', _products[1],
              double.parse(_cantidads[1])),
          CartProduct('assets/img/exampleplant.png', _products[2],
              double.parse(_cantidads[2])),
          CartProduct('assets/img/exampleplant.png', _products[3],
              double.parse(_cantidads[3])),
          cardCheck,
        ],
      ),
    );
  }
}
