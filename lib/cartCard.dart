import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  String _imgPath = "";
  String _title = "";
  String _price = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          child: Image(image: AssetImage('assets/img/exampleplant.png'),
          ),
        ),
      ],
    );
  }
}
