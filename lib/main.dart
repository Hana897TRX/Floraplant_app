<<<<<<< HEAD
import 'package:floraplant_app/home_page.dart';
=======
import 'package:floraplant_app/pages/login_page.dart';
import 'package:floraplant_app/pages/payment.dart';
import 'package:floraplant_app/pages/profile_page.dart';
import 'package:flutter/services.dart';
>>>>>>> 05c2a087270591607dc11b20c496c1f83534930b
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    SystemChrome.setEnabledSystemUIOverlays([]);
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic App',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: MyHomePage(),
=======
    return MaterialApp(
      title: 'Floramundo store',
      home: LoginPage(),
>>>>>>> 05c2a087270591607dc11b20c496c1f83534930b
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            HomePage() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
