import 'package:flutter/material.dart';
import 'package:flutter_insta/models/user_model.dart';
import 'package:flutter_insta/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final AuthMethod _auth = AuthMethod();

  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    UserModel user = await _auth.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
