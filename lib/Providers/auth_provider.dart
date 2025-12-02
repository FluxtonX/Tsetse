import 'package:flutter/material.dart';
import 'package:tsetse/Models/user_model.dart';
import 'package:tsetse/core/services/auth_service.dart';

class AuthProviders with ChangeNotifier {
  final AuthService _authService = AuthService();

  UserModel? _userModel;

  UserModel? get user => _userModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<String?> signup(String name, String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      _userModel = await _authService.signup(name, email, password);

      _isLoading = false;
      notifyListeners();
      return null;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return e.toString();
    }
  }

  Future<String?> Login(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      _userModel = await _authService.Login(email, password);
      _isLoading = false;
      notifyListeners();
      return null;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return e.toString();
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    _userModel = null;
    notifyListeners();
  }
}
