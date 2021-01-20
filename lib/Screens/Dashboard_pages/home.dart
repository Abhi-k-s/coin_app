import 'package:coinapp/Screens/Dashboard_pages/scanner.dart';

import 'dashboard.dart';
import 'package:flutter/material.dart';
import 'profile.dart';


class Home extends StatefulWidget {
  static String route = "Home";

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {


  int _selectedItemIndex = 0;
  var pageController=PageController();

  final List<Widget> pages = [
    Dashboard(),
    profile(),
    Scanner(),
    

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Color(0xFFF0F0F0),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.yellow,
            selectedIconTheme: IconThemeData(color: Colors.blueGrey[600]),
            currentIndex: _selectedItemIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                _selectedItemIndex = index;
                pageController.animateToPage(_selectedItemIndex, duration:Duration(milliseconds: 150), curve: Curves.linear);
              });
            },
            items: [
              BottomNavigationBarItem(
                icon:Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt,),
                title: Text('Scan'),
              ),


            ],
          ),
          body: PageView(
            children:pages,
            onPageChanged: (index){
              setState(() {
                _selectedItemIndex=index;
              });
            },
            controller: pageController,
          )
      ),
    );
  }
}