import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce/features/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

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

  void validateAndSave() {
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;
    formKey.currentState!.save();
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
