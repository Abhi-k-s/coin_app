import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'login.dart';
class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
  return SplashScreen(
    seconds: 4,
    backgroundColor: Colors.black,
    image: Image.asset('assets/jump.gif'),
    title: Text('CoCo',style: TextStyle(fontFamily: 'FanwoodText',color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
    photoSize: 150,

    loaderColor: Colors.black,
    navigateAfterSeconds: Login(),
  );
  }
}
