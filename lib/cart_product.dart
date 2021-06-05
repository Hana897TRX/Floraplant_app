import 'package:floramundo_app/theme.dart';
import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  String imagePath = "";
  String plantTitle = "";
  double price = 0.0;
  int cantidad = 1;
  CartProduct(this.imagePath, this.plantTitle, this.price, this.cantidad,
      {Key key})
      : super(key: key);

  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 120,
        child: Card(
            child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Image(
                image: AssetImage(widget.imagePath),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.plantTitle,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
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
                      child: Text(widget.price.toString()),
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => actualzarCantidad(-1),
                      child: Text(
                        '-',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                    ),
                    Container(
                      width: 50,
                      child: Text(
                        widget.cantidad.toString(),
                        style: TextStyle(
                            color: CustomTheme.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  void actualzarCantidad(int inc) {
    setState(() {
      widget.cantidad += inc;
    });
  }
}
