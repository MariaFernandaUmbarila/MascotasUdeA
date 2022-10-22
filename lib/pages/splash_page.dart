// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    passPage();
    super.initState();
  }

  Future<void> passPage() async{
    Future.delayed(const Duration(seconds: 3), () async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Image(image: AssetImage("assets/logo.jpg"), width: 200, height: 200),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            border: Border.all(color: Colors.black, width: 4)
          ),
        ),
      ),
    );
  }
}
