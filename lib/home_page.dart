import 'package:floramundo_app/catalogueCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'popularCard.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final floraplantLogo = Container(
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
    final search = Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: 2,
          intensity: 0.9,
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 50,
              child: Icon(Icons.search),
            ),
            Flexible(
              child: TextField(
                decoration: InputDecoration(hintText: 'Buscar'),
              ),
            ),
          ],
        ),
      ),
    );
    final categoryMenu = Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'Todo',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              'Exteriores',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              'Interiores',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              'Oficina',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              'Jardín',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
    final popularPlants = Container(
      height: 100,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          PopularCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90),
          PopularCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90),
          PopularCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90),
          PopularCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90),
          PopularCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90),
        ],
      ),
    );
    final textPopular = Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        left: MediaQuery.of(context).size.height * 0.02,
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        'Popular',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
    final textCatalogo = Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        left: MediaQuery.of(context).size.height * 0.02,
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        'Catálogo',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
    var catalogue = Container(
      height: 225,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CatalogueCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90, 21955),
          CatalogueCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90, 21955),
          CatalogueCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90, 21955),
          CatalogueCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90, 21955),
        ],
      ),
    );

    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          floraplantLogo,
          search,
          categoryMenu,
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              textPopular,
              popularPlants,
              textCatalogo,
              catalogue,
              catalogue
            ],
          ),
        ],
      ),
    ));

    void _getProducts() {
      
    }

    Future<http.Response> getProducts(email, password) async {
      return await http
          .post(Uri.parse('http://192.168.1.69/products.php'), body: {
            'action' : "GET_ALL"
          });
    }
  }
}
