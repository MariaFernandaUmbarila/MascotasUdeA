import 'package:firebase_auth/firebase_auth.dart';

class UserRegister{
  Future<String?> registerUser(String email, String password) async{
    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    }on FirebaseAuthException catch(e){
      return e.code;
    }on FirebaseException catch(e){
      return e.code;
    }
  }
}