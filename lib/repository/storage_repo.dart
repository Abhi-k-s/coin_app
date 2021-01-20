import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:coinapp/locator.dart';
import 'package:coinapp/models/user_model.dart';
import 'package:coinapp/repository/auth_repo.dart';

class StorageRepo {
  FirebaseStorage _storage =
  FirebaseStorage(storageBucket: "gs://coinapp-cebf1.appspot.com");
  AuthService _auth = locator.get<AuthService>();

  Future<String> uploadFile(File file) async {
    UserModel user = await _auth.getUser();
    var userId = user.uid;

    var storageRef = _storage.ref().child("user/profile/$userId");
    var uploadTask = storageRef.putFile(file);
    var completedTask = await uploadTask.onComplete;
    String downloadUrl = await completedTask.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> getUserProfileImage(String uid) async {
    return await _storage.ref().child("user/profile/$uid").getDownloadURL();
  }
}