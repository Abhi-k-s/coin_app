import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class paynow extends StatefulWidget{
  @override
  _paynowState createState() => _paynowState();
}

class _paynowState extends State<paynow> {
  Color primaryColor = Color.fromRGBO(255, 200, 50, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: primaryColor,
        title: Text('Pay now', style: TextStyle(fontFamily: 'FanwoodText',color:Colors.blue,fontSize: 30,fontWeight: FontWeight.bold,)),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            Stack(
              children: <Widget>[

                Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),

                    child: Container(
                        width: double.infinity,
                        height: 500.0,
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
                                  padding:EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Material(
                                              borderRadius: BorderRadius.circular(80.0),
                                              color: Colors.purple.withOpacity(0.1),
                                              child: IconButton(
                                                padding: EdgeInsets.all(15.0),
                                                icon: Icon(Icons.camera_alt),
                                                color: Colors.orange,
                                                iconSize: 30.0,
                                                onPressed: () {

                                                },
                                              ),
                                            ),
                                            SizedBox(height: 10.0,),

                                            Text('Scan code',
                                                style: TextStyle(fontFamily: 'FanwoodText',color: Colors.black54,fontSize: 20,
                                                    fontWeight: FontWeight.bold))
                                          ],
                                        ),
                                      ]
                                  )
                              ),

                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Or',style: TextStyle(fontFamily: 'FanwoodText',fontWeight: FontWeight.bold,fontSize:40,),)

                                      ]
                                  )
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        height: 58,
                                        width: 195,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey[500])
                                        ),
                                        child:
                                        TextFormField(

                                          decoration: InputDecoration(

                                            hintText: "Enter CoCo ID",
                                            hintStyle: TextStyle(fontFamily: 'FanwoodText',color: Colors.blue,),
                                            prefixIconConstraints: BoxConstraints(minWidth: 10.0,maxWidth: 40,minHeight: 0.0,maxHeight: 30,),
                                            prefixIcon: Icon(Icons.account_balance),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),]
                                ),
                              ),
                              SizedBox(height:20,),
                              MaterialButton(
                                height:50,
                                minWidth: 100,

                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(55.0)),
                                color:Colors.yellow,
                                child: Text(
                                  'Pay', style: TextStyle(fontFamily: 'FanwoodText',color: Colors.white),

                                ),
                                onPressed: (){},
                              ),


                              SizedBox(height: 55,),
                              MaterialButton(
                                height:50,
                                minWidth: 250,

                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(55.0)),
                                color:primaryColor,
                                child: Text(
                                  'Schedule payment', style: TextStyle(fontFamily: 'FanwoodText',color: Colors.white),

                                ),
                                onPressed: (){},
                              ),





                            ]
                        )
                    )
                )




              ],


            ),


          ],

        ),
      ),
    );


  }
}