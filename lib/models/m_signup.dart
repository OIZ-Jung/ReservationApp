import 'package:flutter/material.dart';

class SignupFieldModel extends ChangeNotifier {
  String name = "";
  String phone = "";
  String email = "";
  String password = "";
  String passwordConfirm = "";

  // 해당 클래스의 함수들은 필드 값을 받아와 설정하고, 이에 따라 변화가 발생했음을 알려줌
  void setName(String name) {
    this.name = name;
    notifyListeners();
  }

  void setPhone(String phone) {
    this.phone = phone;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  void setPasswordConfirm(String passwordConfirm) {
    this.passwordConfirm = passwordConfirm;
    notifyListeners();
  }
}
