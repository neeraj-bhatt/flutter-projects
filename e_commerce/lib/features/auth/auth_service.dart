import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> logIn(String email, String password) async{
    try{
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        throw FirebaseAuthException(code: 'No user found for that email.');
      }else if(e.code == 'wrong-password'){
        throw FirebaseAuthException(code: 'Wrong Password provided for that user.');
      }else{
        throw FirebaseAuthException(code: 'Login failed : ${e.code}');
      }
    }
  }
  
  Future<UserCredential?> signUp(String email, String password) async{
    try{
      final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        throw FirebaseAuthException(code: 'The password provided is too weak');
      }else if(e.code == 'email-already-in-use'){
        throw FirebaseAuthException(code: 'The account already exist for that email.');
      }else{
        throw FirebaseAuthException(code: 'SignUp failed : ${e.code}');
      }
    }
  }
}