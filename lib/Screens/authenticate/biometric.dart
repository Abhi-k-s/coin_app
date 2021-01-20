import 'package:coinapp/Screens/Dashboard_pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Biometric extends StatefulWidget{
  @override
  _BioState createState() => _BioState();
}

class _BioState extends State<Biometric> {
  LocalAuthentication _auth = LocalAuthentication();
  bool _checkBio = false;
  bool _isBioFinger = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen Locked',)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(icon: Icon(Icons.fingerprint, size: 50,),
              onPressed: _startAuth,
              iconSize: 60,),
            SizedBox(height: 15),
            Text('Authenticate biometric'),
          ],
        ),
      ),
    );
  }

  void _checkBiometrics() async {
    try {
      final bio = await _auth.canCheckBiometrics;
      setState(() {
        _checkBio = bio;
        print('Biometrics = $_checkBio');
      });
    } catch (e) {

    }
  }

  void _listBioAndFindFingerType() async {
    List<BiometricType> _listType;
    try {
      _listType = await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e.message);
    }
    print('List Biometrics = $_listType');

    if (_listType.contains(BiometricType.fingerprint)) {
      setState(() {
        _isBioFinger = true;
      });
    }
  }

  void _startAuth() async {
    bool _isAuthenticated = false;
    try {
       _isAuthenticated = await _auth.authenticateWithBiometrics(
        localizedReason: 'Scan your finger',
        useErrorDialogs: true,
        stickyAuth: true,
//        androidAuthStrings: null,
//        iOSAuthStrings: null
      );
    } on PlatformException catch (e){
      print(e.message);
  }

  if(_isAuthenticated){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
  }


}

}