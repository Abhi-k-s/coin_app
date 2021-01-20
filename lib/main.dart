import 'package:coinapp/screens/authenticate/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coinapp/locator.dart';
import 'package:coinapp/screens/authenticate/login.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  setupServices();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coin App',
      initialRoute: Login.route,
      routes: getRoutes(),
    );
  }
}




