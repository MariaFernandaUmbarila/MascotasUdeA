import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mascotas/pages/menu_page.dart';
import 'package:mascotas/pages/register_pet_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List pets = [];

  @override
  void initState(){
    super.initState();
    getPets();
  }

  Future getPets() async{
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    QuerySnapshot pet = await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").get();
    setState(() {
      if(pet.docs.isNotEmpty){
        for(var i in pet.docs){
          pets.add(i.data());
          print("---------------------------------------------------->>>>>>>>>>>>>>>>>>><<< " + i.data().toString());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PETS"),
      ),
      drawer: MenuPage(),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (BuildContext context, i){
          return ListTile(
            title: MyCardImage(pets[i]["photo"], pets[i]["name"] + ' - '+ pets[i]["type"] + ' - ' + pets[i]["breed"])
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30, color: Colors.black),
        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPetPage()));},
      ),
    );
  }
}

class MyCardImage extends StatelessWidget {

  final String url;
  final String text;

  const MyCardImage(this.url, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      margin: const EdgeInsets.all(20),
      elevation: 20,
      color: const Color(0x4C75D0D6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Column(
          children: [
            Image.network(url, width: MediaQuery.of(context).size.width, height: 250,),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              color: const Color(0x4C75D0D6),
              child: Text(text, style: const TextStyle(fontSize: 20, color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}