import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'wallet.dart';

class recharge extends StatelessWidget{
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
                          height: 480.0,
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

                                          Text('Recharge',
                                              style: TextStyle(fontFamily: 'FanwoodText',color:Colors.blue,fontSize: 30,fontWeight: FontWeight.bold,)),
                                        ]
                                    )
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal:0.0,vertical: 10,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[


                                      coin_drop(),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(20),
                                          height: 60,
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
                                              contentPadding: EdgeInsets.only(left: 30,bottom: 10),
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(fontSize:15,color: Colors.blue,fontFamily: 'FanwoodText',),

                                            ),
                                          ),
                                        ),]
                                  ),
                                ),
                                SizedBox(height: 20,),
                                MaterialButton(
                                    color:primaryColor,
                                    minWidth: 60,
                                    height: 45,
                                    child: Text(
                                      'Recharge',
                                      style: TextStyle(fontFamily: 'FanwoodText',color: Colors.red),
                                    ),
                                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(55.0)),
                                    onPressed: (){}
                                ),



                              ]
                          )
                      )
                  ),




                  Padding(
                    padding: EdgeInsets.only(top: 495.0, right: 15.0, left: 15.0),
                    child: Container(
                        width: double.infinity,
                        height: 170.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(10.0, 10.0),
                                  blurRadius: 15.0)
                            ]),
                        child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15,),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Material(
                                              borderRadius: BorderRadius.circular(100.0),
                                              color: Colors.white,
                                              child: IconButton(
                                                padding: EdgeInsets.all(15.0),
                                                icon: Image.asset('assets/Wallet.png',),
                                                color: Colors.purple,
                                                iconSize: 60.0,
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> wallet()));
                                                },
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text('Wallet',
                                                style: TextStyle(fontFamily: 'FanwoodText',
                                                    color: Colors.black54,
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
                                                icon: Icon(Icons.add_to_home_screen),
                                                color: Colors.blue,
                                                iconSize: 60.0,
                                                onPressed: () {},
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text('Transactions',
                                                style: TextStyle(fontFamily: 'FanwoodText',
                                                    color: Colors.black54,
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
                                                icon: Image.asset('assets/savedpayments.png',),
                                                color: Colors.purple,
                                                iconSize: 60.0,
                                                onPressed: () {},
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text('Payment\n method',
                                                style: TextStyle(fontFamily: 'FanwoodText',
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.bold))
                                          ],
                                        ),

                                      ]))])

                    ),
                  ),





                ]
            ),
          ],
        ),

      ),
    );

  }
}



class coin_drop extends StatelessWidget {
// GifController controller=GifController(vsync: this,);
  @override

  Widget build(BuildContext context) {
    AssetImage assetImage=AssetImage('assets/Coin_drop.gif');
    Image image=Image(image: assetImage,repeat: ImageRepeat.repeat,gaplessPlayback:true,filterQuality: FilterQuality.high,);
//GifImage(
    // controller: ,
//  image: AssetImage("assets/Pot.gif"),
//);
    return Container(child: image,
      height: 240,width: 130,);

  }
}