import 'package:app_1/Page/Calender/calender.dart';
import 'package:app_1/Page/Util/Search_1_page.dart';
import 'package:app_1/Page/Around/findaround.dart';
import 'package:app_1/Page/Home/homepage.dart';
import 'package:app_1/Page/Info/myinfopage.dart';
import 'package:app_1/AppBar/appbar.dart';
import 'package:app_1/Global/global.dart';
import 'package:flutter/material.dart';
import 'package:app_1/AppBar/bottomappbar.dart';

import '../../Login/loginpage.dart';
class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  _checkLogout(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(''),
            content: const Text('로그아웃 하시겠습니까?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),);
                },
                child: const Text('네'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('아니오'),
              ),
            ],
          );
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
          appBar: TopAppbar,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(color: Color.fromARGB(
                    100, 238, 238, 255)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/person.jpg',scale: 3,),
                    Padding(padding: EdgeInsets.only(right: 15)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(user.User_Nic,style: TextStyle(fontSize: 20),),
                        Text(user.User_Local,style: TextStyle(color: Colors.grey,fontSize: 10),),
                        Text(user.User_Hobby)
                      ],
                    )
                  ],
                ),
              ),
              ElevatedButton(onPressed: (){
                _checkLogout(context);
              }, child: Text('로그아웃'))
            ],
          ),
            bottomNavigationBar: BtmAppBar

        ),
      ),
    );
  }
}
