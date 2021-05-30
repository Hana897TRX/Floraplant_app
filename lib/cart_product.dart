import 'package:flutter/material.dart';

class CartProduct extends StatelessWidget {
  String _imagePath = "";
  String _plantTitle = "";
  double _price = 0.0;

  CartProduct(this._imagePath, this._plantTitle, this._price);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 150,
        child: Card(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Image(
                  image: AssetImage(_imagePath),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _plantTitle,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text('Price',
                        style: TextStyle(
                          color: Color(0xFFBEBEBE),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(_price.toString()),
                      )
                    ],
                  ),
                  Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => {},
                            child: Text('-',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white
                            ),
                          ),
                          Container(
                            width: 50,
                            child: TextFormField(),
                          ),
                          ElevatedButton(
                            onPressed: () => {},
                            child: 
                            Text(
                              '+',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}