import 'package:coinapp/Screens/authenticate/Splashscreen.dart';
import 'package:coinapp/screens/authenticate/register.dart';
import 'package:coinapp/screens/dashboard_pages/home.dart';
import 'package:coinapp/screens/dashboard_pages/Bin_me.dart';
import 'login.dart';

getRoutes(){
  return
    {
      Home.route: (context) => Home(),
      Login.route: (context) => splash(),
      Register.route: (context) => Register(),s
    };
}