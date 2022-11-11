// ignore_for_file: await_only_futures
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mascotas/model/pet_model.dart';

class PetRegister{
  Future<String?> registerPet(Pet pet) async{
    try{
      final uid = FirebaseAuth.instance.currentUser?.uid;

      QuerySnapshot petName= await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").where("name", isEqualTo: pet.name).get();

      if (petName.docs.isEmpty){
        final petDocument = await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").doc();
        pet.id = petDocument.id;
        final result = await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").doc(pet.id).set(pet.convert());
        return pet.id;
      }else{
        return  "Pet already exists";
      }
    }on FirebaseAuthException catch(e){
      return e.code;
    }on FirebaseException catch(e){
      return e.code;
    }
  }
}