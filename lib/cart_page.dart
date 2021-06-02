import 'package:floramundo_app/models/producto_model.dart';
import 'package:floramundo_app/utils/shared_preferences_cart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cart_product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<Cart> {
  List<String> _productsIds = [];
  List<Producto> productList = [];
  List<String> _cantidads = [];
  @override
  void initState() {
    super.initState();
    List<String> guardados = ["61", "62", "63", "64"];
    List<String> cantidades = ["1", "89", "100", "5"];
    CartSharedPreferences.setProductos(guardados);
    CartSharedPreferences.setCantidades(cantidades);
    _productsIds = CartSharedPreferences.getProductos() ?? [];
    _cantidads = CartSharedPreferences.getCantidades() ?? [];
    int i = 0;
    _productsIds.forEach((id) {
      getProducto(id);
    });
  }

  Future<http.Response> getProducto(product_id) async {
    final response = await http
        .post(Uri.parse('http://192.168.100.27/productos.php'), body: {
      'action': "GET_PRODUCT",
      'product_id': product_id,
    });
    var b;
    this.setState(() {
      b = jsonDecode(response.body);
    });

    final producto = Producto(
        int.parse(b[0]["product_id"]),
        b[0]["name"],
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        55,
        "",
        "",
        "",
        "",
        double.parse(b[0]["price"]));

    productList.add(producto);
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
          new ListView.builder(
            itemCount: productList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) =>
                buildProductCard(context, index),
          ),
          cardCheck
        ],
      ),
    );
  }

  Widget buildProductCard(BuildContext context, int index) {
    final producto = productList[index];
    final cantidadActual = _cantidads[index];
    return Container(
      child: Column(
        children: [
          CartProduct('assets/img/exampleplant.png', producto.name,
              producto.price, cantidadActual)
        ],
      ),
    );
  }
}
