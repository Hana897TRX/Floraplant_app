import 'package:floramundo_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoCuenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final datosCuenta = ListView(
      scrollDirection: Axis.vertical,
      children: [
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0), // if you need this
              side: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 30),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 90),
                          child: IconButton(
                              icon: Icon(FontAwesomeIcons.arrowLeft),
                              onPressed: () => {
                                    Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfilePage()),
                                    )
                                  }),
                        ),
                        Text(
                          'Cuenta',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'WorkSansBold'),
                        ),
                      ],
                    )),
                SizedBox(
                  width: 250,
                  child: const ListTile(
                      title: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Juan Diego Bastidas',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ))),
                ),
                const ListTile(
                    subtitle: Text(
                  'Correo',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Text(
                  "asd@gmail.com",
                  style: TextStyle(color: Colors.black45),
                ),
                const ListTile(
                    subtitle: Text(
                  'Ciudad',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Text(
                  "Cuernavaca",
                  style: TextStyle(color: Colors.black45),
                ),
                const ListTile(
                    subtitle: Text(
                  'Código postal',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Text(
                  "565656",
                  style: TextStyle(color: Colors.black45),
                ),
                const ListTile(
                    subtitle: Text(
                  'Número telefónico',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Text(
                  "7776666666",
                  style: TextStyle(color: Colors.black45),
                ),
                SizedBox(height: 50),
                const ListTile(
                    subtitle: Text(
                  'Número de tarjeta',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Text(
                  "123456789951",
                  style: TextStyle(color: Colors.black45),
                ),
                const ListTile(
                    subtitle: Text(
                  'Nombre en la tarjeta',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Text(
                  "Iván Contreras",
                  style: TextStyle(color: Colors.black45),
                ),
                const ListTile(
                    subtitle: Text(
                  'Fecha de expiración',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Text(
                  "10/22",
                  style: TextStyle(color: Colors.black45),
                ),
              ],
            )),
      ],
    );
    return Scaffold(body: datosCuenta);
  }
}
