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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PETS"),
      ),
      drawer: MenuPage(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hi, ${FirebaseAuth.instance.currentUser?.email}")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30, color: Colors.black),
        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPetPage()));},
      ),
    );
  }
}

class myCardImage extends StatelessWidget {

  final String url;
  final String texto;

  const myCardImage(this.url, this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      margin: const EdgeInsets.all(20),
      elevation: 20,
      color: const Color(0x4C75D0D6);
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Column(
          children: [
            Image.network(url,width: MediaQuery.of(context).size.width,height: 250,),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              color: Colors.lightGreenAccent,
              child: Text(texto, style: const TextStyle(fontSize: 20, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}