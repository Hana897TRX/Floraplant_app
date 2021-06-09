import 'package:floramundo_app/pages/delivery_page.dart';
import 'package:floramundo_app/pages/infoCuenta_page.dart';
import 'package:floramundo_app/pages/orders_page.dart';
import 'package:floramundo_app/utils/authentication_user.dart';
import 'package:floramundo_app/widgets/floraMundoLogo.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:floramundo_app/theme.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'dart:convert';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;
  Map<String, dynamic> user = {};
  AuthenticationUser authenticationUser;
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    authenticationUser = AuthenticationUser(secureStorage);

    authenticationUser.getSession().then((id) async {
      print(id);
      if (id != null) {
        final response = await http.post(
            Uri.parse('http://192.168.100.27/usuarios.php'),
            body: {'action': 'GET_USUARIO', 'customer_id': id.toString()});

        print(response.body);
        setState(() {
          user = json.decode(response.body);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[CustomTheme.white, CustomTheme.white],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
                stops: <double>[0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FloramundoLogo(),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GradientCard(
                      elevation: 2.0,
                      gradient: LinearGradient(
                          colors: <Color>[
                            CustomTheme.pink,
                            CustomTheme.lightgreen
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: <double>[0.0, 1.0],
                          tileMode: TileMode.clamp),
                      shadowColor:
                          Gradients.tameer.colors.last.withOpacity(0.25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                          width: 330.0,
                          height: 150.0,
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 25.0, right: 25.0),
                              child: Text(
                                (user["firstname"].toString() +
                                        " " +
                                        user["lastname"].toString() ??
                                    ""),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.0,
                                    fontFamily: 'WorkSansBold'),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 170.0),
                              child: Text(
                                'Estatus: activo',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'WorkSansBold'),
                              ),
                            ),
                          ])))),
              Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                InfoCuenta(int.parse(user["customer_id"]))),
                      )
                    },
                    child: Card(
                        elevation: 2.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                            width: 330.0,
                            height: 70.0,
                            child: Row(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0, left: 25.0, right: 50.0),
                                child: Text(
                                  'Información de tu cuenta',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontFamily: 'WorkSansBold'),
                                ),
                              ),
                              Icon(FontAwesomeIcons.angleRight)
                            ]))),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrdersPage()),
                      )
                    },
                    child: Card(
                        elevation: 2.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                            width: 330.0,
                            height: 70.0,
                            child: Row(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0, left: 25.0, right: 195.0),
                                child: Text(
                                  'Pedidos',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontFamily: 'WorkSansBold'),
                                ),
                              ),
                              Icon(FontAwesomeIcons.angleRight)
                            ]))),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DatosDelivery()),
                      )
                    },
                    child: Card(
                        elevation: 2.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                            width: 330.0,
                            height: 70.0,
                            child: Row(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0, left: 25.0, right: 55.0),
                                child: Text(
                                  'Información de entrega',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontFamily: 'WorkSansBold'),
                                ),
                              ),
                              Icon(FontAwesomeIcons.angleRight)
                            ]))),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: GestureDetector(
                    onTap: cerrarSesion,
                    child: Card(
                        elevation: 2.0,
                        color: CustomTheme.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                            width: 330.0,
                            height: 70.0,
                            child: Row(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0, left: 25.0, right: 145.0),
                                child: Text(
                                  'Cerrar sesión',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontFamily: 'WorkSansBold'),
                                ),
                              ),
                              Icon(
                                FontAwesomeIcons.signOutAlt,
                                color: CustomTheme.pink,
                              )
                            ]))),
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  void cerrarSesion() {
    secureStorage.delete(key: "SESSION");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }
}
