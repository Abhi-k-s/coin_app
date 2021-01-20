import 'dart:io';
import 'package:coinapp/models/user_model.dart';
import 'package:coinapp/repository/auth_repo.dart';
import 'package:coinapp/screens/profile/avatar.dart';
import 'package:coinapp/view_controller/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coinapp/Screens/authenticate/login.dart';
import 'package:image_picker/image_picker.dart';

import '../../locator.dart';


class profile extends StatefulWidget{
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  UserModel _currentUser = locator.get<UserController>().currentUser;


  @override

  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(

        child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[

                        SizedBox(height: 10.0),
                        Text('Name here',
                            style: TextStyle(fontFamily: 'FanwoodText',
                                color: Colors.black,fontSize: 30,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 7,),
                        Text('Number here',style: TextStyle(fontFamily: 'FanwoodText',fontSize: 20),),
                        SizedBox(height: 6,),
                        Text('email here',style:TextStyle(fontFamily: 'FanwoodText',fontSize: 10) ,),
                      ],
                    ),
                    SizedBox(width: 75.0,),
                    Column(

                      children: <Widget>[
                        Container(

                          child:
                              Padding(
                                padding: EdgeInsets.only(top: 10,right: 10,left: 8),
                      child:
                           Align(
                          alignment: Alignment.topRight,
                          child:
                        Avatar(
                    avatarUrl: _currentUser?.avatarUrl,
                      onTap: () async {
                        File image = await ImagePicker.pickImage(
                            source: ImageSource.gallery);

                        await locator
                            .get<UserController>()
                            .uploadProfilePicture(image);

                        setState(() {});
                      },
                    ),

                        ),
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.0,right: 3),
                          child: IconButton(
                            icon: Icon(Icons.camera, size: 20.0,),
                            onPressed: () async {
                              File image = await ImagePicker.pickImage(
                                  source: ImageSource.gallery);
                              await locator
                                  .get<UserController>()
                                  .uploadProfilePicture(image);
                            },
                          ),
                        ),
                      ],


                    ),



                  ],
                ),
              ),







              Padding(
                padding:EdgeInsets.only(top: 200.0,right: 20,left: 20,),
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
                            icon: Icon(Icons.fingerprint),
                            color: Colors.purple,
                            iconSize: 30.0,
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text('Security',
                            style: TextStyle(fontFamily: 'FanwoodText',color: Colors.black54,
                                fontWeight: FontWeight.bold))
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Material(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.blue.withOpacity(0.1),
                          child: FlatButton(
                            padding: EdgeInsets.all(15.0),
                            color: Colors.blue,
                            child: Text(
                              "Sign out",
                              style: TextStyle(fontFamily: 'FanwoodText',fontSize: 20.0,),
                            ),
                            onPressed: () async {
                              try{
                                await locator.get<AuthService>().signOut();
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                              }catch(e){
                                print("Something went wrong1");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]

        ),
      ),
    );

  }
}