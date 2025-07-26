import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileViewModel{
  final _auth = FirebaseAuth.instance;
  User? get user => _auth.currentUser;

  Future<void> signOut()async{
    await _auth.signOut();
  }
}

final profileViewModelProvider = Provider((ref) => ProfileViewModel());