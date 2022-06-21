import 'package:digi_rentals/Models/user_model.dart';

import 'package:flutter/material.dart';

class UserProviderCart extends ChangeNotifier {
  UserModel _userModel = UserModel();

  void saveUserData(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  UserModel get getUserData => _userModel;
}
