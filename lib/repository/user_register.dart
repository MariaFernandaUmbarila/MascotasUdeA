import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mascotas/model/user_model.dart' as usr;

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

  Future<String?> createUser(usr.User user) async{
    try{
      var document = await FirebaseFirestore.instance.collection("Usuarios").doc(user.id).set(user.convert());
      return user.id;
    }on FirebaseException catch(e){
      return e.code;
    }
  }
}