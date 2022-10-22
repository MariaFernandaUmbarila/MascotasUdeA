// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: const Image(image: AssetImage("assets/logo.jpg"), width: 100, height: 100),
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.black, width: 4)
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Usuer",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person)
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.vpn_key_sharp)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
