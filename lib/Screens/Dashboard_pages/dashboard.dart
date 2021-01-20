//import 'dart:html';

import 'package:coinapp/Screens/Dashboard_pages/Recharge.dart';
import 'package:coinapp/Screens/Dashboard_pages/wallet.dart';
import 'package:coinapp/Screens/Dashboard_pages/earn.dart';
import 'package:coinapp/Screens/Dashboard_pages/Bin_me.dart';
import 'package:coinapp/screens/dashboard_pages/tasks.dart' ;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Animate.dart';
import 'paynow.dart';
import 'redeem.dart';









class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromRGBO(255, 200, 50, 1);



    return Scaffold(



      body: SingleChildScrollView(
        
        child:
            Container(child:
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             Container(
              width: double.infinity,
              decoration: BoxDecoration(

                  color: primaryColor, border: Border.all(color: primaryColor)),
              child: Padding(
                padding: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
                child:

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    logo(),



                  ],
                ),
              ),
            ),

                Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: 350.0,
                    decoration: BoxDecoration(color: primaryColor),
                  ),
                ),

                Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),

                    child: Container(
                      width: double.infinity,
                      height: 205.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0.0, 3.0),
                                blurRadius: 15.0)
                          ]),
                      child:
                      Column(

                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal:3.0,vertical: 10 ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                Text("Welcome",
                                    style: TextStyle(fontFamily: 'FanwoodText',color:Colors.lightBlueAccent,fontSize: 30,fontWeight: FontWeight.bold,)),







                              ],
                            ),
                          ),
                          Padding(
                            padding:EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius: BorderRadius.circular(80.0),
                                      color: Colors.white,
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Image.asset('assets/earn.png',),
                                        color: Colors.purple,
                                        iconSize: 60.0,
                                        onPressed: () {
                                          Navigator.push(context, ease(widget:earn()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Earn',
                                        style: TextStyle(fontFamily: 'FanwoodText',color: Colors.black54,fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius: BorderRadius.circular(100.0),
                                      color: Colors.white,
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Image.asset('assets/redeem.png',),
                                        color: Colors.blue,
                                        iconSize: 60.0,
                                        onPressed: () {
                                          Navigator.push(context,ease(widget:redeem()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text('\tRedeem',
                                        style: TextStyle(fontFamily: 'FanwoodText',fontSize: 18,color: Colors.black54,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius: BorderRadius.circular(100.0),
                                      color: Colors.white,
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Image.asset('assets/Wallet.png',),
                                        color: Colors.blue,
                                        iconSize: 60.0,
                                        onPressed: () {
                                          Navigator.push(context,ease(widget:wallet()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Wallet',
                                        style: TextStyle(fontFamily: 'FanwoodText',
                                            color: Colors.black54,fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                ),

                  Padding(
                    padding: EdgeInsets.only(top: 225.0, right: 25.0, left: 25.0),
                    child: Container(
                      width: double.infinity,
                      height: 375.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0.0, 3.0),
                              blurRadius: 15.0)
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Image.asset('assets/Recharge.png',fit: BoxFit.fitHeight,),
                                      color: Colors.purple,
                                      iconSize: 80.0,
                                      onPressed: () {
                                        Navigator.push(context,ease(widget:recharge()));

                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Recharge',
                                      style: TextStyle(fontFamily: 'FanwoodText',
                                          color: Colors.black54,fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Image.asset('assets/paynow.png'),
                                      color: Colors.blue,
                                      iconSize: 80.0,
                                      onPressed: () {
                                        Navigator.push(context,ease(widget:paynow()));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Pay now',
                                      style: TextStyle(fontFamily: 'FanwoodText',
                                          color: Colors.black54,fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Image.asset('assets/binme.png'),
                                      color: Colors.pink,
                                      iconSize: 80.0,
                                      onPressed: () {
                                        Navigator.push(context, ease(widget:Binme()));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Bin Me',
                                      style: TextStyle(fontFamily: 'FanwoodText',
                                          color: Colors.black54,fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Image.asset('assets/Tasks.png'),
                                      color: Colors.purpleAccent,
                                      iconSize: 80.0,
                                      onPressed: () {
                                        Navigator.push(context, ease(widget:Tasks()));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Tasks',
                                      style: TextStyle(fontFamily: 'FanwoodText',
                                          color: Colors.black54,fontSize: 18,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),



                      ],
                    ),
                  ),
                ),
              ],
            ),


            Padding(
              padding: EdgeInsets.only(left: 35.0, bottom: 25.0,top: 10,),
              child: Container(
                height: 195.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    UpcomingCard(
                      title:'Task title here',
                      value: 'time here',
                      reward: 50,
                      color: Colors.orange[700],
                    ),
                    UpcomingCard(
                      title: 'Task title here',
                      value: 'time here',
                      color: Colors.orange[300],
                        reward: 50
                    ),
                    UpcomingCard(
                      title: 'Task title here',
                      value:'time here',
                      color: Colors.yellow,
                        reward: 50
                    ),
                    UpcomingCard(
                      title: 'Task title here',

                      value:'time here',
                      reward: 50 ,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
      ),



      floatingActionButton:FloatingActionButton(
        child:IconButton(
          icon: Image.asset('assets/bot.png',),
        ) ,
        onPressed: () {

        },),


    );

  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 380, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}


class logo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage=AssetImage('assets/logo.png');
    Image image=Image(image: assetImage);

    return Container(child: image,
      height: 100,);
  }
}

class UpcomingCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final double reward;

  UpcomingCard({this.title, this.value, this.color,this.reward});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Container(
        width: 150.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(fontFamily: 'FanwoodText',
                      color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Text('Time:$value',
                  style: TextStyle(fontFamily: 'FanwoodText',
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              Text('Coins:$reward',
                  style: TextStyle(fontFamily: 'FanwoodText',
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
