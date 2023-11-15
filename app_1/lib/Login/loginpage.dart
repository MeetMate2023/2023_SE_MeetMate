import 'package:app_1/Login/registration.dart';
import 'package:app_1/Page/Home/homepage.dart';
import 'package:app_1/Global/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ID = TextEditingController();
  final Password = TextEditingController();
  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('오류'),
            content: const Text('아이디 또는 비밀번호를 확인해주세요'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('확인'),
              ),
            ],
          );
        });
  }
  void login() {
    if (ID.text.isEmpty || Password.text.isEmpty) {
      print(ID.text);
      print(Password.text);
      return;
    }
    final options = {
      "id": ID.text,
      "password": Password.text,
    };
    print(options);
    dio
        .post("$baseUrl/login", data: options)
        .then((result) async => {
              print(result),
              if (result.data["id"].isNotEmpty)
                {
        setState(() {
          user.User_Nic = result.data["nickname"];
          user.User_Local = result.data["local"];
          user.User_Name = result.data["name"];
          user.User_Hobby = result.data["hobby"];
          user.User_type = result.data["company_check"];
        }),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  ),
               }
              else{
                _showDialog(context)
              }
            })
        .catchError((error) => {
              print(error),
            });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      return false;
    },
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                scale: 1.5,
              ),
              Padding(padding: EdgeInsets.all(30)),
              Align(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 30),
                ),
                alignment: Alignment(-0.8, 0),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 50,
                  child: TextField(
                    controller: ID,
                    decoration: InputDecoration(labelText: 'ID'),
                  )),
              Padding(padding: EdgeInsets.only(bottom: 2.5)),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 50,
                  child: TextField(
                    controller: Password,
                    decoration: InputDecoration(labelText: 'password'),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Registration();
                    }));
                  },
                  child: Text('회원가입')),
              ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text('로그인')),
            ],
          ),
        ),
      )),
    );
  }
}
