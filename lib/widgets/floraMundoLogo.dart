import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FloramundoLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Floramundo Store',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 45,
            height: 45,
            child: Image(
              image: AssetImage('assets/img/floraplant.png'),
            ),
          ),
        ],
      ),
    );
  }
}
