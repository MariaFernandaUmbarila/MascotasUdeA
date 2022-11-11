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
    var result = await petRegister.registerPet(newPet);
    if(result == "Pet already exists"){
      msg.showMessage("Pet already exists");
    }else {
      msg.showMessage("Pet register was successful");
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void bringData(){
    setState(() {
      String photo = "https://firebasestorage.googleapis.com/v0/b/desarrollomovil-f5db0.appspot.com/o/img_pets%2Fmichi.png?alt=media&token=fcd73687-0174-4946-8de2-8b856144aee4";
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
                        suffixIcon: Icon(Icons.type_specimen, color: Colors.orange, size: 24)
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: breed,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        labelText: "Breed",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.scatter_plot_sharp, color: Colors.orange, size: 24)
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: age,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Age",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today, color: Colors.orange, size: 24)
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