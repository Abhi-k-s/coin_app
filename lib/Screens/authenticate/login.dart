import 'package:coinapp/Screens/Dashboard_pages/dashboard.dart';
import 'package:coinapp/screens/dashboard_pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'package:coinapp/repository/auth_repo.dart';
import 'package:coinapp/locator.dart';
import 'package:splashscreen/splashscreen.dart';



class Login extends StatefulWidget {
  static String route = "login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  String error = '';
  String email = '';
  String password = '';
  AuthService _auth = AuthService();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/border.png"),
                fit: BoxFit.fill
              ),
                gradient: LinearGradient(
                    colors: [
                      Colors.yellow[700],
                      Colors.yellow[500],
                      Colors.yellow[200]
                    ]
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 25,top: 15),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Welcome",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'FanwoodText',
                            color: Colors.white,
                            fontSize: 60),
                      ),
                      SizedBox(height: 50.0),
                      Text(
                        "CoCo Login",
                        style: TextStyle(
                            fontFamily: 'FanwoodText',
                            color: Colors.blue[500],
                            fontSize: 40,
                            fontWeight:FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),

                Container(
                  height: 385,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30.0),
                        Container(
                          padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 85, 27, 0.5),
                                  blurRadius: 10,
                                  offset: Offset(0,0)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[

                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                            decoration: InputDecoration(
                                                hintText: "Enter your email",
                                                hintStyle: TextStyle(fontFamily: 'FanwoodText',color: Colors.grey),
                                                border: InputBorder.none
                                            ),
                                            validator: (val) => val.isEmpty ? 'Enter an email' : null,
                                            onChanged: (val) {
                                              setState(() => email = val);
                                            }
                                        ),
                                        Divider(),
                                        TextFormField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: "Enter your password",
                                            hintStyle: TextStyle(fontFamily: 'FanwoodText',color: Colors.grey),
                                            border: InputBorder.none,
                                          ),
                                          validator: (val) => val.length < 8 ? 'Enter valid password' : null,
                                          onChanged: (val) {
                                            setState(() => password = val);
                                          },
                                        ),
                                      ]
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container( child: Text("Forgot Password?",style:TextStyle(color: Colors.grey,fontFamily: 'FanwoodText',),),
                        ),
                        SizedBox(height: 20.0),
                        RaisedButton(
                            color: Colors.yellow,
                            child: Text(
                              'Login',
                              style: TextStyle(fontFamily: 'FanwoodText',color: Colors.white),
                            ),
                            onPressed: () async {
                              try{
                                await locator
                                    .get<AuthService>()
                                    .signInWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
                                Navigator.pushNamed(context, Home.route);
                              } catch(e){
                                print("Something went wrong!");
                              }
                            }
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, Register.route);
                            },
                            child: Text("Not a member? Sign up here",style:TextStyle(fontFamily: 'FanwoodText',color: Colors.grey),),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, Home.route);
                            },
                            child: Text("Go to Dashboard",style:TextStyle(fontFamily: 'FanwoodText',color: Colors.grey),),
                          ),
                        ),
                        SizedBox(height: 20.0)
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),


        ));}
}