import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mascotas/pages/menu_page.dart';
import 'package:mascotas/pages/walker_detail_page.dart';

class WalkersPage extends StatefulWidget{
  const WalkersPage({Key? key}) : super(key: key);
  
  @override
  State<WalkersPage> createState() => _WalkersPageState();
}

class _WalkersPageState extends State<WalkersPage> {

  List walkers = [];
  List<dynamic> idDocs = [];
  final search = TextEditingController();

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

  Future getCity() async{

    idDocs.clear();
    walkers.clear();
    String id = "";
    QuerySnapshot paseoCiudad= await FirebaseFirestore.instance.collection("Paseadores").where("ciudad", isEqualTo: search.text).get();
    setState(() {
      if(paseoCiudad.docs.isNotEmpty){
        for(var i in paseoCiudad.docs){
          id = i.id; //Trae el id
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
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, left: 50, right: 0),
                    child: TextFormField(
                      controller: search,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: "City",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
              ),
              IconButton(
                  onPressed: (){setState(() {getCity();});},
                  padding: const EdgeInsets.only(right: 50, left: 10),
                  icon: const Icon(Icons.search, size: 50, color: Colors.white)
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: walkers.length,
                  itemBuilder: (BuildContext context, i){
                    return Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(walkers[i]['foto']),
                              radius: 50,
                            )
                        ),
                        Expanded(
                            child: ListTile(
                              title: Text(walkers[i]["nombre"], style: const TextStyle(fontSize: 20, color: Colors.black, )),
                              subtitle: Text(walkers[i]["ciudad"]),
                              onTap: (){
                                WalkerData paseadorNew = WalkerData(idDocs[i], walkers[i]["nombre"], walkers[i]["ciudad"], walkers[i]["contacto"], walkers[i]["foto"], walkers[i]["perfil"]);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> WalkerDetailPage(paseadorNew)));
                              },
                            )
                        )
                      ],
                    );
                  }
              ),
            ),
          )
        ],
      )
    );
  }
}

class WalkerData{

  String nombre = "", ciudad = "", contacto = "", foto = "", perfil = "", id = "";

  WalkerData(this.nombre, this.ciudad, this.contacto, this.foto, this.perfil, this.id);
}

