import 'package:flutter/material.dart';

class CatalogueCard extends StatelessWidget {
  String _imgPath = "";
  String _category = "";
  String _title = "";
  double _price = 0.0;
  int _code = 0;

  CatalogueCard(
      this._imgPath, this._category, this._title, this._price, this._code);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image(
                image: AssetImage('assets/img/exampleplant.png'),
              ),
            ),
            Container(
              child: Text(
                _category,
                style: TextStyle(
                  color: Color(0xFFBEBEBE),
                ),
              ),
            ),
            Container(
              child: Text(
                _title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                'Price',
                style: TextStyle(
                  color: Color(0xFFBEBEBE),
                ),
              ),
            ),
            Container(
              child: Text(
                _price.toString(),
              ),
            ),
            Container(
              child: Text(
                'Code',
                style: TextStyle(
                  color: Color(0xFFBEBEBE),
                ),
              ),
            ),
            Container(
              child: Text(
                _code.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
