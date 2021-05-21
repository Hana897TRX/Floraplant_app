import 'package:floramundo_app/pages/delivery_page.dart';
import 'package:floramundo_app/pages/infoCuenta_page.dart';
import 'package:floramundo_app/pages/profile_page.dart';
import 'package:floramundo_app/widgets/floraMundoLogo.dart';
import 'package:floramundo_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:floramundo_app/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'login_page.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key key}) : super(key: key);

  @override
  _OrdersPage createState() => _OrdersPage();
}

class _OrdersPage extends State<OrdersPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
                                        builder: (context) => ProfilePage()),
                                  )
                                }),
                      ),
                      Text(
                        'Pedidos',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'WorkSansBold'),
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GradientCard(
                      elevation: 2.0,
                      gradient: LinearGradient(
                          colors: <Color>[Colors.blue, Colors.lightBlue],
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
                          height: 100.0,
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 10, right: 25.0),
                              child: Text(
                                '10-02-2021',
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
                                'Estatus: pendiente',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'WorkSansBold'),
                              ),
                            ),
                          ])))),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GradientCard(
                      elevation: 2.0,
                      gradient: LinearGradient(
                          colors: <Color>[Colors.blue, Colors.lightBlue],
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
                          height: 100.0,
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 10, right: 25.0),
                              child: Text(
                                '15-04-2021',
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
                                'Estatus: realizado',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'WorkSansBold'),
                              ),
                            ),
                          ])))),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GradientCard(
                      elevation: 2.0,
                      gradient: LinearGradient(
                          colors: <Color>[Colors.blue, Colors.lightBlue],
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
                          height: 100.0,
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 10, right: 25.0),
                              child: Text(
                                '9-03-2021',
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
                                'Estatus: pendiente',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'WorkSansBold'),
                              ),
                            ),
                          ])))),
            ],
          ),
        ),
      ),
    ));
  }
}
