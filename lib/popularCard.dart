import 'package:floramundo_app/pages/payment.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class PopularCard extends StatefulWidget {
  String imgPath = "";
  String category = "";
  String plantTitle = "";
  double cost = 0.0;
  int id = 0;
  PopularCard(
    this.id,
    this.imgPath,
    this.category,
    this.plantTitle,
    this.cost,
  );

  @override
  _PopularCard createState() => _PopularCard();
}

class _PopularCard extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => plantSelected(widget.id, context),
      child: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
        child: Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                width: 50,
                height: 50,
                child: Image(
                  image: AssetImage(widget.imgPath),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, left: 25, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.category,
                      style: TextStyle(color: Color(0xFFBEBEBE)),
                    ),
                    Text(
                      widget.plantTitle,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.cost.toString(),
                      style: TextStyle(color: Color(0xFF6B6A6A)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void plantSelected(int id, context) {
    print(id);

    //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ClaseSegundaPantalla(id)));
    // ----- CAMBIA LA CLASE COMENTADA LLAMADA "ClaseSegundaPantalla" POR LA CLASE QUE VAS A CREAR DEL PRODUCTO
  }
}
