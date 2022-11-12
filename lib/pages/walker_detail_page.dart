import 'package:flutter/material.dart';
import 'package:mascotas/pages/home_page.dart';
import 'package:mascotas/pages/walkers_page.dart';

class WalkerDetailPage extends StatefulWidget{

  final WalkerData walkerData;

  WalkerDetailPage(this.walkerData);

  @override
  State<WalkerDetailPage> createState() => _WalkerDetailPageState();
}

class _WalkerDetailPageState extends State<WalkerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.walkerData.nombre),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: MyCardImage(
              widget.walkerData.foto,
              widget.walkerData.nombre + " \n" + widget.walkerData.contacto + "\n" + widget.walkerData.perfil
          ),
        ),
      ),
    );
  }
}