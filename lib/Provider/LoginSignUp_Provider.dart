import 'package:flutter/cupertino.dart';

class LoginSignUpProvider with ChangeNotifier {
  bool _isCreate_Account = true;
  bool get isCreate_Account => _isCreate_Account;
  void setCreateAccount() {
    _isCreate_Account = true;
    notifyListeners();
  }

  void Login() {
    _isCreate_Account = false;
    notifyListeners();
  }
}
