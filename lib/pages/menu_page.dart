import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mascotas/pages/login_page.dart';

class MenuPage extends StatelessWidget {

  String url = "https://cdn.pixabay.com/photo/2021/11/01/21/36/cartoon-cat-6761858_1280.png";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  color: Colors.green
              ),
              child: Image.network(url)
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person_pin, size: 30, color: Colors.black,),
                title: Text((FirebaseAuth.instance.currentUser?.email).toString(), style: const TextStyle( fontSize: 16)),
                textColor: Colors.black,
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app, size: 20, color: Colors.blue,),
                title: const Text("Exit", style: TextStyle( fontSize: 20)),
                textColor: Colors.blue,
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}