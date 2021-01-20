import 'package:coinapp/screens/authenticate/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coinapp/repository/auth_repo.dart';
import 'package:coinapp/locator.dart';

class Register extends StatefulWidget {

  static String route = "register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  String error = '';
  String fname;
  String lname;
  String phoneNumber;
  String email;
  String password;

  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildfName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'First Name',labelStyle: TextStyle(fontFamily: 'FanwoodText',)),
      maxLength: 15,
      validator: (String value) {
        if (value.isEmpty) {
          return 'First Name is Required';
        }
        return null;
      },
      onChanged: (String value) {
        fname = value;
      },
    );
  }

  Widget _buildlName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Last Name',labelStyle: TextStyle(fontFamily: 'FanwoodText',)),
      maxLength: 15,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Last Name is Required';
        }
        return null;
      },
      onChanged: (String value) {
        lname = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email',labelStyle: TextStyle(fontFamily: 'FanwoodText',)),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }
        else if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }
        return null;
      },
      onChanged: (value) {
        setState(() => email = value);
      },
    );
  }

  Widget _buildPassword1() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password',labelStyle: TextStyle(fontFamily: 'FanwoodText',)),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }
        else if(value.length<8) {
          return 'Minimum 8 characters required';
        }
        return null;
      },
      onChanged: (value) {
        setState(() => password = value);
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number',labelStyle: TextStyle(fontFamily: 'FanwoodText',)),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.length == 0) {
          return 'Please enter mobile number';
        }
        String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
        RegExp regExp = new RegExp(pattern);
        if (!regExp.hasMatch(value)) {
          return 'Please enter valid mobile number';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          phoneNumber = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Signup to CoCo",style: TextStyle(fontFamily: 'FanwoodText',),), backgroundColor: Colors.yellow,centerTitle: true,toolbarOpacity: 0.9,),
        body:SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                      child:Column(
                          children: <Widget>[
                            _buildfName(),
                            _buildlName(),
                            _buildEmail(),
                            _buildPhoneNumber(),
                            _buildPassword1(),
                          ]
                      )
                  ),
                  SizedBox(height: 30),
                  MaterialButton(

                      child:
                      Text(
                        'Register',
                        style: TextStyle(fontFamily: 'FanwoodText',color: Colors.white),
                      ),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(55.0)),
                      color: Colors.orange,
                      minWidth: 160,
                      height: 50,
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          try{
                            await locator
                                .get<AuthService>()
                                .registerWithEmailAndPassword(
                              email: email,
                              password: password,
                              fname: fname,
                              lname: lname,
                              phone: phoneNumber,
                            );
                            Navigator.pushNamed(context, Login.route);
                          } catch(e){
                            print("Something went wrong!");
                          }
                        }
                      }
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}






