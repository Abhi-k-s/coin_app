

import 'dashboard.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


class redeem extends StatefulWidget{
  @override
  _redeemState createState() => _redeemState();
}

class _redeemState extends State<redeem> {
  Color primaryColor = Color.fromRGBO(255, 200, 50, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
        actions: <Widget>[
          IconButton(
            alignment: Alignment(100, 4),
            icon: Image.asset('assets/logo.png'),
            onPressed: (){},

          )
        ],
      ),
      body: SingleChildScrollView(



        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),

                  child: Container(
                    width: double.infinity,
                    height: 250.0,
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
                          padding: EdgeInsets.symmetric(horizontal:5.0,vertical: 10 ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Text('Redeem',
                                  style: TextStyle(fontFamily: 'FanwoodText',color:Colors.blue,fontSize: 30,fontWeight: FontWeight.bold,)),

                            ],
                          ),
                        ),


                        Padding(
                          padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                                      icon: Image.asset('assets/gold.png',),
                                      color: Colors.orange,
                                      iconSize: 60.0,
                                      onPressed: () {

                                      },
                                    ),
                                  ),
                                 // SizedBox(height: 8.0),
                                  //Text('', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold))
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.white,
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Image.asset('assets/silver.png',),
                                      color: Colors.grey,
                                      iconSize: 60.0,
                                      onPressed: () {},
                                    ),
                                  ),
                                //  SizedBox(height: 8.0),
                                //  Text('', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold))
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.white,
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Image.asset('assets/bronze.png',),
                                      color: Colors.brown,
                                      iconSize: 60.0,
                                      onPressed: () {},
                                    ),
                                  ),
                                 // SizedBox(height: 8.0),
                                 // Text('', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [BoxShadow(
                                              color: Color.fromRGBO(225, 85, 27, 0.5),
                                              blurRadius: 0,
                                              offset: Offset(0,0)
                                          )]

                                      ),
                                    )
                                  ],



                                ),

                                Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [BoxShadow(
                                              color: Color.fromRGBO(225, 85, 27, 0.5),
                                              blurRadius: 0,
                                              offset: Offset(0,0)
                                          )]


                                      ),

                                    )
                                  ],



                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [BoxShadow(
                                              color: Color.fromRGBO(225, 85, 27, 0.5),
                                              blurRadius: 0,
                                              offset: Offset(0,0)
                                          )]

                                      ),
                                    )
                                  ],



                                ),
                              ],




                            )
                        ),

                        SizedBox(height: 15,),


                      ],
                    ),
                  ),


                ),



                Padding(
                    padding: EdgeInsets.only(top:270,left: 15,right: 15,),

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
                        child:
                        Column(

                            children: <Widget>[

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text('Reward value',
                                            style: TextStyle(fontFamily: 'FanwoodText',
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,fontSize: 20))
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(

                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [BoxShadow(
                                                color: Color.fromRGBO(225, 85, 27, 0.5),
                                                blurRadius: 0,
                                                offset: Offset(0,0),

                                              )]


                                          ),
                                          constraints: BoxConstraints(minWidth: 70,maxWidth: 80,minHeight: 20,maxHeight: 30,),
                                        )



                                      ],
                                    ),

                                  ],
                                ),
                              ),



                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 35.0,vertical: 10,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text('\tWallet balance\t\t',
                                            style: TextStyle(fontFamily: 'FanwoodText',
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,fontSize: 20))
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(

                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [BoxShadow(
                                                color: Color.fromRGBO(225, 85, 27, 0.5),
                                                blurRadius: 0,
                                                offset: Offset(0,0),

                                              )]


                                          ),
                                          constraints: BoxConstraints(minWidth: 80,maxWidth: 100,minHeight: 20,maxHeight: 30,),
                                        )



                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              Divider(),


                              Padding(
                                padding: EdgeInsets.symmetric(horizontal:5.0,vertical: 10 ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[


                                    Text('Enter your required money',
                                        style: TextStyle(fontFamily: 'FanwoodText',color:Colors.redAccent,fontSize: 15,fontWeight: FontWeight.bold,)),







                                  ],
                                ),

                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(3),
                                        height: 40,
                                        width: 250,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.0),
                                            border: Border.all(color: Colors.grey[300])
                                        ),
                                        child:
                                        TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(

                                            hintText: "Enter recharge amount",
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(fontFamily: 'FanwoodText',color: Colors.blue,fontSize: 15,),

                                          ),
                                        ),
                                      ),]
                                ),
                              ),


                              Padding(
                                  padding:EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Material(
                                              borderRadius: BorderRadius.circular(80.0),
                                              color: Colors.purple.withOpacity(0.1),
                                              child: IconButton(
                                                padding: EdgeInsets.all(15.0),
                                                icon: Icon(Icons.account_balance),
                                                color: Colors.orange,
                                                iconSize: 30.0,
                                                onPressed: () {

                                                },
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text('Account transfer',
                                                style: TextStyle(fontFamily: 'FanwoodText',color: Colors.black54,
                                                    fontWeight: FontWeight.bold))
                                          ],
                                        ),

                                        Column(
                                          children: <Widget>[
                                            Material(
                                              borderRadius: BorderRadius.circular(80.0),
                                              color: Colors.purple.withOpacity(0.1),
                                              child: IconButton(
                                                padding: EdgeInsets.all(15.0),
                                                icon: Icon(Icons.account_balance),
                                                color: Colors.orange,
                                                iconSize: 30.0,
                                                onPressed: () {

                                                },
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text('BHIM UPI',
                                                style: TextStyle(fontFamily: 'FanwoodText',color: Colors.black54,
                                                    fontWeight: FontWeight.bold))
                                          ],
                                        ),

                                      ]
                                  )
                              )
                            ]
                        )
                    )
                )






              ],
            )





          ],

        ),

      ),

    );



  }
}
