import 'package:flutter/widgets.dart';

class UserModel extends ChangeNotifier {
  var isLogin = false;
  var name = 'Jack';

  setName(name) {
    this.name = name;
    notifyListeners();
  }

  login() {
    isLogin = true;
    notifyListeners();
  }

  logout() {
    isLogin = false;
    notifyListeners();
  }
}