import 'dart:convert';

import 'package:floramundo_app/utils/shared_preferences_cart.dart';
import 'package:flutter/material.dart';
import 'package:floramundo_app/models/producto_model.dart';
import 'package:http/http.dart' as http;

class PlantDetails extends StatefulWidget {
  //const PlantDetails({Key key}) : super(key: key);
  int idProducto;
  PlantDetails(this.idProducto);

  @override
  _PlantDetails createState() => _PlantDetails(idProducto);
}

class _PlantDetails extends State<PlantDetails> {
  int idProducto;
  Producto product = new Producto.empty();
  final description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu ipsum magna. Mauris ultricies rutrum massa vel bibendum. Donec sed elementum ligula.";
  final noteText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu ipsum magna. Mauris ultricies rutrum massa vel bibendum. Donec sed elementum ligula.";

  _PlantDetails(this.idProducto);

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    Widget plant = Container(
      margin: EdgeInsets.all(8),
      //decoration: BoxDecoration(color: Colors.blue),
      height: 200,
      child: Card(
        elevation: 6,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image(
                image: AssetImage('assets/img/exampleplant.png'),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Interior',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Text(
                    product.name,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "\$ " + product.price.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade200),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    final descriptionCard = Container(
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 8,
        child: Row(
          children: [
            Container(
              //decoration: BoxDecoration(color: Colors.blue),
              width: 175,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nombre com??n:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'G??nero:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Familia bot??nica:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Origen:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Presentaci??n:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Esquejes por caja:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Dimensiones de caja en cm:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Peso aproximado:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'C??digo:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  product.comunName,
                ),
                Text(
                  product.gender,
                ),
                Text(
                  product.family,
                ),
                Text(
                  product.origin,
                ),
                Text(
                  product.presentation,
                ),
                Text(
                  product.cuttingBox,
                ),
                Text(
                  product.dimensions,
                ),
                Text(
                  product.weight.toString(),
                ),
                Text(
                  product.code,
                )
              ],
            ),
          ],
        ),
      ),
    );

    final note = Flexible(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Card(
          elevation: 8,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text("NOTA\n" + noteText),
          ),
        ),
      ),
    );

    final btnWhats = Container(
      margin: EdgeInsets.only(
        top: 8,
        left: 16,
        right: 16,
      ),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF00E676),
        ),
        onPressed: () {},
        child: Text('??Dudas?'),
      ),
    );

    final btnAdd = Container(
      margin: EdgeInsets.only(
        top: 8,
        left: 16,
        right: 16,
      ),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF00E676),
        ),
        onPressed: addCarrito,
        child: Text('A??adir al carrito'),
      ),
    );

    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [plant, descriptionCard, note, btnWhats, btnAdd],
        ));
  }

  void addCarrito() {
    List<String> _productsIds = CartSharedPreferences.getProductos() ?? [];
    List<String> _cantidads = CartSharedPreferences.getCantidades() ?? [];
    bool existe = false;
    for (var i = 0; i < _productsIds.length; i++) {
      if (_productsIds[i] == idProducto.toString()) {
        existe = true;
        _cantidads[i] = (int.parse(_cantidads[i]) + 1).toString();
      }
    }
    if (!existe) {
      _productsIds.add(idProducto.toString());
      _cantidads.add("1");
    }

    CartSharedPreferences.setCantidades(_cantidads);
    CartSharedPreferences.setProductos(_productsIds);
    Navigator.pop(context);
    _showToast(context);
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Agregado correctamente'),
        action: SnackBarAction(
            label: 'Ok', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Future<Producto> getProduct() async {
    final response = await http.post(
        Uri.parse('http://192.168.100.27/productos.php'),
        body: {'action': 'GET_PRODUCT', 'product_id': idProducto.toString()});

    var data;
    setState(() {
      data = json.decode(response.body);
    });

    print(data);

    if (response.statusCode == 200 && response.body.length > 10) {
      product.name = data[0]['name'];
      product.id = int.parse(data[0]['product_id']);
      product.description = data[0]['description'];
      product.price = double.parse(data[0]['price']);
    }

    return product;
  }
}
