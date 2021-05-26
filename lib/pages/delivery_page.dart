import 'package:floramundo_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DatosDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final datos = Container(
      height: 700,
      width: 550,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
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
                              padding: const EdgeInsets.only(right: 20),
                              child: IconButton(
                                  icon: Icon(FontAwesomeIcons.arrowLeft),
                                  onPressed: () => {
                                        Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfilePage()),
                                        )
                                      }),
                            ),
                            Text(
                              'Información de envío',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'WorkSansBold'),
                            ),
                          ],
                        )),
                    const ListTile(
                        subtitle: Text(
                      'Dirección de envío',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Text(
                      "Lorem pisu",
                      style: TextStyle(color: Colors.black45),
                    ),
                    const ListTile(
                        subtitle: Text(
                      'Ciudad',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Text(
                      "Lorem pisu",
                      style: TextStyle(color: Colors.black45),
                    ),
                    const ListTile(
                        subtitle: Text(
                      'Código postal',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Text(
                      "Lorem pisu",
                      style: TextStyle(color: Colors.black45),
                    ),
                    const ListTile(
                        subtitle: Text(
                      'Nombre de quien lo recibe',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Text(
                      "Lorem pisu",
                      style: TextStyle(color: Colors.black45),
                    ),
                    const ListTile(
                        subtitle: Text(
                      'Número telefónico',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Text(
                      "Lorem pisu",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
    return Scaffold(body: datos);
  }
}
