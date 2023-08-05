import 'package:bazar/app/service/models/usermodel.dart';
import 'package:flutter/material.dart';

class userProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    username: '',
    email: '',
    password: '',
    confirmpassword: '',
    type: '',
    token: '',
    cart: [],
  );

  User get user => _user;

  void setuser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void SetUser(User user) {
    _user = user;
    notifyListeners();
  }
}
