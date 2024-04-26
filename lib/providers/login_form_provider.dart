import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
