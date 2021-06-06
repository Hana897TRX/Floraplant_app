import 'dart:convert';

import 'package:floramundo_app/catalogueCard.dart';
import 'package:floramundo_app/models/producto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'popularCard.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<Widget> popularProducts = [];

  @override
    void initState() {
      super.initState();
      getPopus();

    }



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
        child: new ListView.builder(
          itemCount: popularProducts.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) =>
                      buildPopularCard(context, index),
        ),

       // child: //ListView(
            //shrinkWrap: true,
            //scrollDirection: Axis.horizontal,
            //children:
            /*
            FutureBuilder(
                future: getPopus(context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    Container(
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Text('${snapshot.data[index].title}');
                            }));
                  }
                })*/
        /*PopularCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90),
          PopularCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90),
          PopularCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90),
          PopularCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90),
          PopularCard('assets/img/exampleplant.png', 'Indoor',
              'Great Balls of Fire White', 90),*/

        //),
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
    final catalogue = Container(
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
  }

  Future<http.Response> getProducts() async {
    final response = await http.post(
        Uri.parse("http://192.168.1.69/productos.php"),
        body: {'action': 'GET_ALL'});

    List data = jsonDecode(response.body);
    /*
    if(response.statusCode == 200 && response.body.length > 10){
      for(int i = 0; i < data.length; i++){
        PopularCard popularCard = new PopularCard(_imgPath, _category, _plantTitle, _cost);
        popularProducts.add();
      }
    }
    */
  }

  Future<List<Widget>> getPopus() async {
    final response = await http.post(
        Uri.parse("http://192.168.1.69/productos.php"),
        body: {'action': 'GET_POPUS'});

    print(response.body);

    var dataPopus = jsonDecode(response.body);
    print(dataPopus);
    if (response.statusCode == 200 && response.body.length > 10) {
      for (int i = 0; i < dataPopus.length; i++) {
        PopularCard popularCard = new PopularCard(
            dataPopus[i]["product_id"],
            "assets/img/exampleplant.png",
            dataPopus[i]["catName"],
            dataPopus[i]["name"],
            double.parse(dataPopus[i]["price"]));
        popularProducts.add(popularCard);
      }
    }
    return popularProducts;
  }


Widget buildPopularCard(BuildContext context, int index){
  return popularProducts[index];
}



}
