import 'package:flutter/material.dart';
import 'package:grpcmobil/view/loginPage.dart';
import 'package:grpcmobil/view/myWastesPage.dart';
import 'controller/loginController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Atık Var',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: StartApp());
  }
}

class StartApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StartAppState();
  }
}

class StartAppState extends State<StartApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    bool isLogged = await LoginController.isLogged();
    if (isLogged == null || isLogged == false) {
      Route route = MaterialPageRoute(builder: (context) => LoginPage());
      Navigator.pushReplacement(context, route);
    } else {
      Route route = MaterialPageRoute(builder: (context) => MyWastesPage());
      Navigator.pushReplacement(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
