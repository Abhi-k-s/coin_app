

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

import 'Animate.dart';
import 'Bin_me.dart';
import 'dashboard.dart';
import 'tasks.dart';

class earn extends StatelessWidget{
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             
              Stack(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 9.0, right: 15.0, left: 15.0),

                        child: Container(
                            width: double.infinity,
                            height: 450.0,
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

                                        Text('Earn',
                                            style: TextStyle(fontFamily: 'FanwoodText',color:Colors.blue,fontSize: 30,fontWeight: FontWeight.bold,)),

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal:0.0,vertical: 10,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[


                                     pot(),

                                      ],
                                    ),
                                  ),
                                  SizedBox(height:30,),
                                  Padding(
                                    padding:EdgeInsets.symmetric(horizontal: 30,vertical: 10),
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
                                                icon: Image.asset('assets/Tasks.png',),
                                                color: Colors.purple,
                                                iconSize: 70.0,
                                                onPressed: () {
                                                  Navigator.push(context,ease(widget:Tasks()));
                                                },
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text('Tasks',
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
                                                icon: Image.asset('assets/binme.png',),
                                                color: Colors.green,
                                                iconSize: 70.0,
                                                onPressed: () {
                                                  Navigator.push(context,ease(widget:Binme()));
                                                },
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
                                            Text('Bin Me',
                                                style: TextStyle(fontFamily: 'FanwoodText',color: Colors.black54,fontSize: 18,
                                                    fontWeight: FontWeight.bold))
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ])))

                  ])]




        ),
      ),

    );
  }
}

class pot extends StatelessWidget {
// GifController controller=GifController(vsync: this,);
  @override

  Widget build(BuildContext context) {
  AssetImage assetImage=AssetImage('assets/Pot.gif');
  Image image=Image(image: assetImage,repeat: ImageRepeat.repeat,gaplessPlayback:true,filterQuality: FilterQuality.high,);
//GifImage(
 // controller: ,
//  image: AssetImage("assets/Pot.gif"),
//);
    return Container(child: image,
      height: 110,width: 180,);

  }
}