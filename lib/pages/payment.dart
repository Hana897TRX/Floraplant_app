import 'package:floramundo_app/pages/login_page.dart';
import 'package:floramundo_app/pages/profile_page.dart';
import 'package:floramundo_app/theme.dart';
import 'package:floramundo_app/widgets/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DescripcionPago extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modalPago = Container(
      height: 700,
      width: 550,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // if you need this
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 0),
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
                      Container(
                        width: 400.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                                subtitle: Text(
                              'Dirección',
                              textAlign: TextAlign.left,
                            )),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Dirección'),
                            ),
                            const ListTile(
                                subtitle: Text(
                              'Ciudad',
                              textAlign: TextAlign.left,
                            )),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Ciudad'),
                            ),
                            const ListTile(
                                subtitle: Text(
                              'Código postal',
                              textAlign: TextAlign.left,
                            )),
                            TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'C.P.'),
                            ),
                            const ListTile(
                                subtitle: Text(
                              'Nombre de quién va a recibir',
                              textAlign: TextAlign.left,
                            )),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Nombre'),
                            ),
                            const ListTile(
                                subtitle: Text(
                              'Número telefónico',
                              textAlign: TextAlign.left,
                            )),
                            TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Número'),
                            )
                          ],
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          'Método de pago',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton.icon(
                            label: const Text('Paypal'),
                            icon: Icon(FontAwesomeIcons
                                .ccPaypal), //CAMBIAR ÍCONO POR EL DE PAYPAL
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                          TextButton.icon(
                            label: const Text('Depósito'),
                            icon: Icon(FontAwesomeIcons.moneyCheckAlt),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TarjetaDatos()),
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
    return Scaffold(body: modalPago);
  }
}

class TarjetaDatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardDatosTarjeta = Container(
      height: 700,
      width: 550,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // if you need this
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: IconButton(
                                    icon: Icon(FontAwesomeIcons.arrowLeft),
                                    onPressed: () => {
                                          Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()),
                                          )
                                        }),
                              ),
                              Text(
                                'Deposito bancario',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'WorkSansBold'),
                              ),
                            ],
                          )),
                      Container(
                        width: 400.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                                subtitle: Text(
                              'CLABE',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            Text(
                              "35309539589083",
                              style: TextStyle(color: Colors.black45),
                            ),
                            const ListTile(
                                subtitle: Text(
                              'Benficiario',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            Text(
                              "Floramundo",
                              style: TextStyle(color: Colors.black45),
                            ),
                            const ListTile(
                                subtitle: Text(
                              'Banco',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            Text(
                              "Banamex",
                              style: TextStyle(color: Colors.black45),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton.icon(
                            label: const Text('Continuar'),
                            icon: Icon(Icons
                                .arrow_right), //CAMBIAR ÍCONO POR EL DE PAYPAL
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResumenPago()),
                              );
                            },
                          ),
                          SizedBox(width: 20),
                          TextButton.icon(
                            label: const Text('Regresar'),
                            icon: Icon(
                                Icons.error), //CAMBIAR ÍCONO POR EL DE PAYPAL
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
    return Scaffold(body: cardDatosTarjeta);
  }
}

class ResumenPago extends StatelessWidget {
  FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    final resumen = Container(
      height: 700,
      width: 550,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(0), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(1),
                        width: 1,
                      ),
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: IconButton(
                                      icon: Icon(FontAwesomeIcons.arrowLeft),
                                      onPressed: () => {
                                            Navigator.pop(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                            )
                                          }),
                                ),
                                Text(
                                  'Resumen del envío',
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
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 90, bottom: 30)),
                        // const ListTile(
                        //     subtitle: Text(
                        //   'Número de tarjeta',
                        //   textAlign: TextAlign.left,
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // )),
                        // Text(
                        //   "Lorem pisu",
                        //   style: TextStyle(color: Colors.black45),
                        // ),
                        // const ListTile(
                        //     subtitle: Text(
                        //   'Nombre en la tarjeta',
                        //   textAlign: TextAlign.left,
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // )),
                        // Text(
                        //   "Lorem pisu",
                        //   style: TextStyle(color: Colors.black45),
                        // ),
                        // const ListTile(
                        //     subtitle: Text(
                        //   'Fecha de expiración',
                        //   textAlign: TextAlign.left,
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                _showToast(context);
                                flutterSecureStorage.deleteAll();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavigationBar()),
                                  (route) => false,
                                );
                              },
                              child: const Text("Confirmado"),
                              style: ElevatedButton.styleFrom(
                                primary: CustomTheme.lightgreen,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
    return Scaffold(body: resumen);
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Confirmado'),
        action: SnackBarAction(
            label: 'Ok', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
