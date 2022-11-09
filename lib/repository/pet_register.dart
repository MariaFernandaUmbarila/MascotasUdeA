import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mascotas/model/pet_model.dart';

class PetRegister{
  Future<String?> registerPet(Pet pet) async{
    try{
      final uid = FirebaseAuth.instance.currentUser?.uid;
      final petDocument = await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").doc();
      pet.id = petDocument;
      final result = await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").doc().set(pet.convert());
      return pet.id;
    }on FirebaseAuthException catch(e){
      return e.code;
    }on FirebaseException catch(e){
      return e.code;
    }
  }
}