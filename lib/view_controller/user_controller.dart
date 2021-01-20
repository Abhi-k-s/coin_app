import 'dart:io';

import 'package:coinapp/locator.dart';
import 'package:coinapp/models/user_model.dart';
import 'package:coinapp/repository/auth_repo.dart';
import 'package:coinapp/repository/storage_repo.dart';

class UserController {
  UserModel _currentUser;
  AuthService _auth = locator.get<AuthService>();
  StorageRepo _storageRepo = locator.get<StorageRepo>();
  Future init;

  UserController() {
    init = initUser();
  }

  Future<UserModel> initUser() async {
    _currentUser = await _auth.getUser();
    return _currentUser;
  }

  UserModel get currentUser => _currentUser;

  Future<void> uploadProfilePicture(File image) async {
    _currentUser.avatarUrl = await _storageRepo.uploadFile(image);
  }

  Future<String> getDownloadUrl() async {
    return await _storageRepo.getUserProfileImage(currentUser.uid);
  }

  Future<void> signInWithEmailAndPassword(
      {String email, String password}) async {
    _currentUser = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    _currentUser.avatarUrl = await getDownloadUrl();
  }

  void updateDisplayName(String displayName) {
    _currentUser.displayName = displayName;
    _auth.updateDisplayName(displayName);
  }

  Future<bool> validateCurrentPassword(String password) async {
    return await _auth.validatePassword(password);
  }

  void updateUserPassword(String password) {
    _auth.updatePassword(password);
  }
}