import 'package:flutter/material.dart';
import 'package:balanced_meal/models/user_model.dart';

class UserProvider with ChangeNotifier {
    double totalCal = 0;

  late UserModel _user;

  UserModel get user => _user;

  void setUser(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }

  void  setCalculateCalForUser(
      {required String gender, required UserModel newUser}) {
    _user = newUser;
    notifyListeners();


    if (_user.gendre == "Male") {
      totalCal = 666.47 +
          (13.75 * _user.wight) +
          (5 * _user.height) -
          (6.75 * _user.age);
    } else {
      totalCal = ((655.1) +
          (9.56 * _user.wight) +
          (1.85 * _user.height) -
          (4.67 * _user.age));
    }
    ChangeNotifier();
  }

 double getTotalCal(){

  return double.parse(totalCal.toStringAsFixed(3));
 }
}
