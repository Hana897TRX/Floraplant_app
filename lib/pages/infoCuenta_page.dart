import 'package:floramundo_app/pages/profile_page.dart';
import 'package:floramundo_app/theme.dart';
import 'package:floramundo_app/utils/authentication_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InfoCuenta extends StatefulWidget {
  int idUser;
  InfoCuenta(this.idUser);

  @override
  _InfoCuenta createState() => _InfoCuenta();
}

class _InfoCuenta extends State<InfoCuenta> {
  Map<String, dynamic> data = {};

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<String> getUser() async {
    final response = await http
        .post(Uri.parse('http://192.168.100.27/usuarios.php'), body: {
      'action': 'GET_USUARIO',
      'customer_id': widget.idUser.toString()
    });

    print(response.body);
    setState(() {
      data = json.decode(response.body);
    });

    print(data);
  }

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
                Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoCuenta(111)),
                        )
                      },
                      child: Card(
                          elevation: 2.0,
                          color: Colors.green.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                              width: 330.0,
                              height: 70.0,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      (data["firstname"].toString() +
                                              " " +
                                              data["lastname"].toString() ??
                                          ""),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]))),
                    )),
                const ListTile(
                    subtitle: Text(
                  'Correo',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Text(
                  data["email"] ?? "",
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
                  data["telephone"] ?? "",
                  style: TextStyle(color: Colors.black45),
                ),
                SizedBox(height: 50),
              ],
            )),
      ],
    );
    return Scaffold(body: datosCuenta);
  }
}
