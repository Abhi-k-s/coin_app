import'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Binme extends StatefulWidget {
  @override
  _BinmeState createState() => _BinmeState();
}
class _BinmeState extends State<Binme> {
  List<String> _locations = ['F block', 'G block', 'B block',];
  String _selectedLocation;
  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  QRViewController controller;
  Color primaryColor = Color.fromRGBO(255, 200, 50, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(
          elevation: 0,
          
          brightness: Brightness.light,
          backgroundColor: primaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 15, color: Colors.black,),
          ),
          actions: <Widget>[
            IconButton(
              alignment: Alignment(100, 4),
              icon: Image.asset('assets/logo.png'),
              iconSize: 20,
              onPressed: (){},

            )
          ],
        ),

        body:
      


        Column(children:<Widget>[
          Expanded(
            flex:5,
            child:QRView(key:qrKey,overlay:QrScannerOverlayShape(
              borderRadius: 10,
              borderColor: Colors.red,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 200,
            ),
                onQRViewCreated:_onQRViewCreate),
          ),
          Expanded(
            child:
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child:

             Container(

              child: Row(

              children: <Widget>[
                Column(

                children: <Widget>[
                  DropdownButton(
                      hint: Text('Select your bin'),
                  value: _selectedLocation,
                  onChanged: (newValue) {
                setState(() {
                _selectedLocation = newValue;
               });
              },
               items: _locations.map((location) {
                return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
                )
                ],


                ),
                SizedBox(width: 40,),
                Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.circular(80.0),
                      color: Colors.purple.withOpacity(0.1),
                      child: IconButton(
                        padding: EdgeInsets.all(15.0),
                        icon: Icon(Icons.history),
                        color: Colors.purple,
                        iconSize: 20.0,
                        onPressed: () {},
                      ),
                    ),
                  SizedBox(height: 7,),
                    Text('History',
                        style: TextStyle(color: Colors.black54,
                            fontWeight: FontWeight.bold))
                    ])
                  ],
              )
            )
          )
          )
                  ],
                ),


            );



 //         ),
          /*Expanded(
            flex:1,
            child:Center(
              child:Text('Scan Result:$qrText'),
            ),),*/

  }
  @override
  void dispose()
  {
    controller?.dispose();
    super.dispose();
  }
  void _onQRViewCreate(QRViewController controller)
  {
    this.controller=controller;
    controller.scannedDataStream.listen((scanData)
    {
      setState((){
        qrText=scanData;
      }
      );
    });

  }
}

