import 'package:flutter/material.dart';

class CatalogueCard extends StatefulWidget {
  String _imgPath = "";
  String _category = "";
  String _title = "";
  double _price = 0.0;
  int _id = 0;
  CatalogueCard(
      this._id, this._imgPath, this._category, this._title, this._price);

  @override
  _CatalogueCard createState() => _CatalogueCard();

}

class _CatalogueCard extends State<CatalogueCard>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => plantSelected(widget._id, context),
    child: Container(
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
                widget._category,
                style: TextStyle(
                  color: Color(0xFFBEBEBE),
                ),
              ),
            ),
            Container(
              child: Text(
                widget._title,
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
                widget._price.toString(),
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
          ],
        ),
      ),
    ));
  }

  void plantSelected(int id, context){
    print(id);
  }
}
