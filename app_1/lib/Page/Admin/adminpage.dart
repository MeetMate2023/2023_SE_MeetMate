import 'package:flutter/material.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("관리자 전용"),),
      body: Container(),

    )),);
  }
}
