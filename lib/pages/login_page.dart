// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:mascotas/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mascotas/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email = TextEditingController();
  final password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void validUserNoDB(){
    if(email.text.isNotEmpty && password.text.isNotEmpty){
      if (email.text == "test@gmail.com" && password.text == "1234") {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
      }else {
        showMessage("Incorrect data");
      }
    }else{
      showMessage("All data is required");
    }
  }

  void validUser() async{
    try {
      final user = await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
      if(user != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }on FirebaseAuthException catch(e){
      if(e.code == "invalid-user"){
        showMessage("The email format is not correct");
      }
      if(e.code == "user-not-found"){
        showMessage("The user does not exist");
      }
      if(e.code == "wrong-password"){
        showMessage("Wrong password");
      }
      if(e.code == "unknown"){
        showMessage("Complete all the data");
      }
      //20:02
    }
  }

  void showMessage(String msg){
    final screen = ScaffoldMessenger.of(context);
    screen.showSnackBar(SnackBar(
        content: Text(msg, style: const TextStyle(fontSize: 18)),
        backgroundColor: const Color(0xFFFF9800),
        duration: const Duration(seconds: 7),
        action: SnackBarAction(
          label: "OK",
          onPressed: screen.hideCurrentSnackBar,
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: const Image(image: AssetImage("assets/logo.jpg"), width: 100, height: 100),
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.black, width: 4)
                  ),
                ),
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person, color: Colors.orange, size: 24)
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
                TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20, color: Colors.teal)
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                    },
                    child: const Text("Register")
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
                    onPressed: (){validUser();},
                    child: const Text("Login")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
