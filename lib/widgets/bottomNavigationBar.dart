import 'package:floramundo_app/home_page.dart';
import 'package:floramundo_app/pages/infoCuenta_page.dart';
import 'package:floramundo_app/pages/payment.dart';
import 'package:floramundo_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme.dart';

class NavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationBar();
  }
}

class _NavigationBar extends State<NavigationBar> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    HomePage(),
    DescripcionPago(),
    ProfilePage()
  ];
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapTapped,
        currentIndex: indexTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                color: CustomTheme.green,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.shoppingCart,
                color: CustomTheme.green,
              ),
              label: "Carrito"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.user,
                color: CustomTheme.green,
              ),
              label: "Perfil"),
        ],
      ),
    );
  }
}
