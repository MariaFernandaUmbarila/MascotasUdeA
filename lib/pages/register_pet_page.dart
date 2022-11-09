// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:mascotas/model/pet_model.dart';
import 'package:mascotas/pages/home_page.dart';
import 'package:mascotas/pages/login_page.dart';
import 'package:mascotas/pages/menu_page.dart';
import 'package:mascotas/repository/pet_register.dart';

class RegisterPetPage extends StatefulWidget {
  const RegisterPetPage({Key? key}) : super(key: key);

  @override
  State<RegisterPetPage> createState() => _RegisterPetPageState();
}

enum Gender{Female, Male}

class _RegisterPetPageState extends State<RegisterPetPage> {

  final name = TextEditingController();
  final type = TextEditingController();
  final breed = TextEditingController();
  final age = TextEditingController();
  Gender? _gender = Gender.Female;

  late Message msg;
  PetRegister petRegister = PetRegister();

  void savePet(Pet newPet) async{
    var id = await petRegister.registerPet(newPet);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void bringData(){
    setState(() {
      String photo = "gs://desarrollomovil-f5db0.appspot.com/img_pets/michi.png";
      bool formNotEmpty = name.text.isNotEmpty && type.text.isNotEmpty && breed.text.isNotEmpty
      && age.text.isNotEmpty;

      if(formNotEmpty){
        String newGender = "Female";
        if(_gender == Gender.Male){
          newGender = "Male";
        }
        var newPet = Pet("", name.text, type.text, breed.text, age.text, newGender, photo);
        savePet(newPet);
      }else{
        msg.showMessage("There is missing data to be filled");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    msg = Message(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Register pet"),
      ),
      drawer: MenuPage(),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  TextFormField(
                    controller: name,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.person, color: Colors.orange, size: 24)
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: type,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        labelText: "Type",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.person, color: Colors.orange, size: 24)
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: breed,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Breed",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.email, color: Colors.orange, size: 24)
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: age,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        labelText: "Age",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.phone, color: Colors.orange, size: 24)
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    title: const Text("Female"),
                    leading: Radio<Gender>(
                      value: Gender.Female,
                      groupValue: _gender,
                      onChanged: (Gender? value){setState(() {_gender = value;});},
                    ),
                  ),
                  ListTile(
                    title: const Text("Male"),
                    leading: Radio<Gender>(
                      value: Gender.Male,
                      groupValue: _gender,
                      onChanged: (Gender? value){setState(() {_gender = value;});},
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          shadowColor: Colors.black12,
                          textStyle: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20
                          )
                      ),
                      onPressed: (){bringData();},
                      child: const Text("Register")
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}