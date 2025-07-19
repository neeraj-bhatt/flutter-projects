import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> logIn(String email, String password) async{
    try{
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        print('No user found for that email.');
      }else if(e.code == 'wrong-password'){
        print('Wrong Password provided for that user.');
      }
    }
    return null;
  }
  
  Future<UserCredential?> signUp(String email, String password) async{
    try{
      final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        print('The password provided is too weak');
      }else if(e.code == 'email-already-in-use'){
        print('The account already exist for that email.');
      }
    }catch (e){
      print(e);
    }
    return null;
  }
}