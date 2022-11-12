import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mascotas/pages/home_page.dart';
import 'package:mascotas/pages/menu_page.dart';
import 'package:mascotas/pages/walker_detail_page.dart';

class WalkersPage extends StatefulWidget{
  const WalkersPage({Key? key}) : super(key: key);
  
  @override
  State<WalkersPage> createState() => _WalkersPageState();
}

class _WalkersPageState extends State<WalkersPage> {

  List walkers = [], idDocs = [];

  @override
  void initState(){
    super.initState();
    getWalkers();
  }

  Future getWalkers() async{
    String id = "";
    QuerySnapshot walker = await FirebaseFirestore.instance.collection("Paseadores").get();
    setState(() {
      if(walker.docs.isNotEmpty){
        for(var i in walker.docs){
          id = i.id;
          idDocs.add(id);
          walkers.add(i.data());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WALKERS")
      ),
      drawer: MenuPage(),
      body: ListView.builder(
        itemCount: walkers.length,
        itemBuilder: (BuildContext context, i){
          return ListTile(
            title: MyCardImage(walkers[i]["foto"], walkers[i]["nombre"] + " - " + walkers[i]["ciudad"]),
            onTap: (){
              WalkerData newWalker = WalkerData(walkers[i]["nombre"], walkers[i]["ciudad"], walkers[i]["contacto"], walkers[i]["foto"], walkers[i]["perfil"], idDocs[i]);
              Navigator.push(context, MaterialPageRoute(builder: (context) => WalkerDetailPage(newWalker)));
            },
          );
        },
      ),
    );
  }
}

class WalkerData{

  String nombre = "", ciudad = "", contacto = "", foto = "", perfil = "", id = "";

  WalkerData(this.nombre, this.ciudad, this.contacto, this.foto, this.perfil, this.id);
}

