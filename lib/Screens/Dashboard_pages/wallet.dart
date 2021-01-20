import 'package:coinapp/Screens/Dashboard_pages/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class wallet extends StatefulWidget{
  @override
  _walletState createState() => _walletState();
}

class _walletState extends State<wallet> {
  Color primaryColor = Color.fromRGBO(255, 200, 50, 1);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: primaryColor,
        title: Text('Wallet',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'FanwoodText',color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold,),),
        centerTitle: true,
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
      body:




      ListView(



        children: <Widget>[

          Padding(
              padding: EdgeInsets.only(top: 9.0, right: 15.0, left: 15.0),

              child: Container(
                  width: double.infinity,
                  height: 156.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(10.0, 3.0),
                            blurRadius: 15.0)
                      ]),
                  child:
                  Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:5.0,vertical: 15 ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Text('Your Wallet contains',
                                  style: TextStyle(fontFamily: 'FanwoodText',color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold,)),

                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:5.0,vertical: 15 ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                          offset: Offset(0,0),

                                        )]


                                    ),
                                    constraints: BoxConstraints(minWidth: 90,maxWidth: 100,minHeight: 30,maxHeight: 40,),
                                  )



                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),

                      ]
                  )
              )
          ),









          Container(


          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:0.0,vertical: 10 ),
            height: 70,

            child:


            ListTile(

              leading: Icon(Icons.account_balance),
              title:Text('My transactions',style: TextStyle(fontFamily: 'FanwoodText',),),
              subtitle: Text('Payments',style: TextStyle(fontFamily: 'FanwoodText',),),


            ),



          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal:0.0,vertical: 10 ),
            height: 70,
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title:Text('Rewards earned',style: TextStyle(fontFamily: 'FanwoodText',),),
              subtitle: Text('in coins',style: TextStyle(fontFamily: 'FanwoodText',),),


            ),



          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal:0.0,vertical: 10 ),
            height: 70,
            child: ListTile(
              leading: Icon(Icons.receipt),
              title:Text('Recharge history',style: TextStyle(fontFamily: 'FanwoodText',),),
              subtitle: Text(''),



            ),



          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal:0.0,vertical: 10 ),
            height: 70,
            child: ListTile(
              leading: Icon(Icons.import_export),
              title:Text('Savings and expense Analysis',style: TextStyle(fontFamily: 'FanwoodText',),),
              subtitle: Text(''),



            ),



          ),

        ],
      ),




    );
  }
}
