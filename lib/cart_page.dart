import 'package:floramundo_app/models/producto_model.dart';
import 'package:floramundo_app/pages/payment.dart';
import 'package:floramundo_app/theme.dart';
import 'package:floramundo_app/utils/adaptativeSize.dart';
import 'package:floramundo_app/utils/shared_preferences_cart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cart_product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  int id;
  Cart(this.id);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<Cart> {
  List<String> _productsIds = [];
  List<Producto> productList = [];
  List<String> _cantidads = [];
  double total = 0.0;
  void actualizarTotal() async {
    setState(() {
      total = 0;
      for (var i = 0; i < productList.length; i++) {
        print(productList[i].price);
        total += productList[i].price * double.parse(_cantidads[i]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print(widget.id);
    _productsIds = CartSharedPreferences.getProductos() ?? [];
    _cantidads = CartSharedPreferences.getCantidades() ?? [];
    // _productsIds.add("70");
    // _productsIds.add("71");
    // _cantidads.add("4");
    // _cantidads.add("5");
    // CartSharedPreferences.setCantidades(_cantidads);
    // CartSharedPreferences.setProductos(_productsIds);
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
        "assets/img/exampleplant.png",
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
    actualizarTotal();
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
    final cardCheck = Padding(
      padding: const EdgeInsets.only(top: 545),
      child: Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        height: 150,
        child: Card(
          color: Colors.grey[350],
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Total',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Text(
              "\$ $total",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DescripcionPago()),
                )
              },
              child: Text(
                'Pagar',
                style: TextStyle(
                    color: CustomTheme.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(primary: CustomTheme.green),
            ),
          ]),
        ),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            cardTitle,
            Stack(
              children: [
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
          ],
        ),
      ),
    ));
  }

  void actualzarCantidad(index, int inc) {
    setState(() {
      _cantidads[index] = (int.parse(_cantidads[index]) + inc).toString();
      CartSharedPreferences.setCantidades(_cantidads);
      actualizarTotal();
    });
  }

  void removeProducto(index) {
    setState(() {
      _cantidads.removeAt(index);
      productList.removeAt(index);
      _productsIds.removeAt(index);
      CartSharedPreferences.setCantidades(_cantidads);
      CartSharedPreferences.setProductos(_productsIds);
      actualizarTotal();
    });
  }

  Widget buildProductCard(BuildContext context, int index) {
    final producto = productList[index];
    int cantidadActual = int.parse(_cantidads[index]);

    return Container(
      child: Column(
        children: [
          // CartProduct('assets/img/exampleplant.png', producto.name,
          //     producto.price, int.parse(cantidadActual))
          Container(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 120,
              child: Card(
                  child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Image(
                      image: AssetImage(producto.imagePath),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            producto.name,
                            style: TextStyle(
                              fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 20),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              color: Color(0xFFBEBEBE),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(producto.price.toString()),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => actualzarCantidad(index, -1),
                            child: Text(
                              '-',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: CustomTheme.pink),
                          ),
                          Container(
                            width: 50,
                            child: Text(
                              cantidadActual.toString(),
                              style: TextStyle(
                                  color: CustomTheme.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => actualzarCantidad(index, 1),
                            child: Text(
                              '+',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: CustomTheme.pink),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: GestureDetector(
                              onTap: () => removeProducto(index),
                              child: Container(
                                alignment: Alignment.topRight,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.trashAlt,
                                  color: CustomTheme.green,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
