// ignore_for_file: sort_child_properties_last, constant_identifier_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:mascotas/pages/login_page.dart';
import 'package:mascotas/repository/user_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Gender{Female, Male}

class _RegisterPageState extends State<RegisterPage> {

  final name = TextEditingController();
  final surname = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordCon = TextEditingController();
  Gender? _gender = Gender.Female;

  User_Register user_register = User_Register();

  void saveUser() async{
    bool result = await user_register.registerUser(email.text, password.text);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    child: const Image(image: AssetImage("assets/logo.jpg"), width: 100, height: 100),
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(color: Colors.black, width: 4),
                        gradient: const LinearGradient(                          
                          begin: Alignment.topCenter,
                          end: Alignment(0.0, 1.0),
                          tileMode: TileMode.repeated,
                          colors: <Color>[Color(0xFF76FF03), Color(0xFF00B8D4)]
                      )
                    ),
                  ),
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
                    controller: surname,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        labelText: "Surname",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.person, color: Colors.orange, size: 24)
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.email, color: Colors.orange, size: 24)
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        labelText: "Phone number",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.phone, color: Colors.orange, size: 24)
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: address,
                    keyboardType: TextInputType.streetAddress,
                    decoration: const InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.location_history, color: Colors.orange, size: 24)
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    maxLength: 16,
                    decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.vpn_key_sharp, color: Colors.orange, size: 24)
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordCon,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    maxLength: 16,
                    decoration: const InputDecoration(
                        labelText: "Password confirmation",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.vpn_key_sharp, color: Colors.orange, size: 24)
                    ),
                  ),
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
                      onPressed: (){saveUser();},
                      child: const Text("Register")
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
