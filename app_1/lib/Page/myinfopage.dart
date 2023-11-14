import 'package:app_1/Page/calender.dart';
import 'package:app_1/Page/categorypage.dart';
import 'package:app_1/Page/findaround.dart';
import 'package:app_1/Page/homepage.dart';
import 'package:app_1/Page/myinfopage.dart';
import 'package:app_1/Page/recommendpage.dart';
import 'package:app_1/AppBar/appbar.dart';
import 'package:app_1/global.dart';
import 'package:flutter/material.dart';
import 'package:app_1/AppBar/bottomappbar.dart';
class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: TopAppbar,
          body: Row(
            children: [
              Column(
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
                ],
              ),
            ],

          ),
            bottomNavigationBar: BtmAppBar

        ),
      ),
    );
  }
}
