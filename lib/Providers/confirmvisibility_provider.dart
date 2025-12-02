import 'package:flutter/material.dart';

class ConfirmvisibilityProvider with ChangeNotifier {
  bool _isObscure = true;

  bool get isObscure => _isObscure;

  void toggleVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
