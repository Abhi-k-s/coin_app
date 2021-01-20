import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coinapp/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  Future<UserModel> signInWithEmailAndPassword(
      {String email, String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserModel> getUser() async {
    var firebaseUser = await _auth.currentUser();
    return UserModel(firebaseUser.uid, displayName: firebaseUser.displayName);
  }

  Future<void> registerWithEmailAndPassword({String email, String password, String fname, String lname, String phone}) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser firebaseUser = result.user;
    if (result != null) {
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = fname;
      firebaseUser.updateProfile(updateInfo)
      .then((value) {
        Firestore.instance.collection("USERS")
            .document()
            .setData(
            {
              'fname':fname,
              'lname':lname,
              'email':email,
              'phone':phone,
            });
      });
      if (firebaseUser != null) {
        await firebaseUser.updateProfile(updateInfo);
      }
    }
    return UserModel(firebaseUser.uid, displayName: firebaseUser.displayName);
  }

  Future<void> signOut() async{
    try {
      await _auth.signOut();
      return UserModel(null, displayName: null);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> updateDisplayName(String displayName) async {
    var user = await _auth.currentUser();

    user.updateProfile(
      UserUpdateInfo()..displayName = displayName,
    );
  }

  Future<bool> validatePassword(String password) async {
    var firebaseUser = await _auth.currentUser();

    var authCredentials = EmailAuthProvider.getCredential(
        email: firebaseUser.email, password: password);
    try {
      var authResult = await firebaseUser
          .reauthenticateWithCredential(authCredentials);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> updatePassword(String password) async {
    var firebaseUser = await _auth.currentUser();
    firebaseUser.updatePassword(password);
  }
}

class DatabaseServices {


}
