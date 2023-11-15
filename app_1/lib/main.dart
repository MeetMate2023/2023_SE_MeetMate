import 'package:app_1/Login/loginpage.dart';
import 'package:app_1/Page/Calender/calender.dart';
import 'package:app_1/Page/Home/homepage.dart';
import 'package:app_1/Page/Info/myinfopage.dart';
import 'package:app_1/Page/Util/writepage.dart';
import 'package:app_1/testpage.dart';
import 'package:flutter/material.dart';

import 'Login/pickhobbypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Login()
    );

  }
}

