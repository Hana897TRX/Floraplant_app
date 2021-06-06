import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  String _imgPath = "";
  String _category = "";
  String _plantTitle = "";
  double _cost = 0.0;
  int _id=0;

  PopularCard(this._id,this._imgPath, this._category, this._plantTitle, this._cost);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                image: AssetImage(_imgPath),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, left: 25, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _category,
                    style: TextStyle(color: Color(0xFFBEBEBE)),
                  ),
                  Text(
                    _plantTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _cost.toString(),
                    style: TextStyle(color: Color(0xFF6B6A6A)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
