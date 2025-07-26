import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce/features/auth/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLogin = true;
  String firstName = '';
  String lastName = '';
  String phone = '';
  String email = '';
  String password = '';

  void toggleMode() {
    isLogin = !isLogin;
    notifyListeners();
  }

  void saveField(String field, String value) {
    switch (field) {
      case 'firstName':
        firstName = value;
        break;
      case 'lastName':
        lastName = value;
        break;
      case 'phone':
        phone = value;
        break;
      case 'email':
        email = value;
        break;
      case 'password':
        password = value;
        break;
      default:
        break;
    }
  }

  void save() {
    final authService = AuthService();
    if(isLogin){
      authService.logIn(email, password);
    }else{
      authService.signUp(email, password);
    }
  }
}

final authViewModelProvider =
    ChangeNotifierProvider<AuthViewModel>((ref) => AuthViewModel());
