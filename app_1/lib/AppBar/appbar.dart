import 'package:app_1/Page/Admin/adminpage.dart';
import 'package:app_1/Page/Util/Search_1_page.dart';
import 'package:app_1/Global/global.dart';
import 'package:app_1/Page/Util/invitationpage.dart';
import 'package:flutter/material.dart';

final AppBar TopAppbar = AppBar(
  toolbarHeight: 70,
  title: Text(
    user.User_Local,
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
  ),
  actions: [
    Row(
      children: [
        ElevatedButton(
            onPressed: () {
              if (user.User_Nic.compareTo("admin") == 0) {
                Navigator.push(navigatorContext, MaterialPageRoute(
                  builder: (context) {
                    return Adminpage();
                  },
                ));
              } else {
                print(user.User_Nic);
                showDialog(
                    context: navigatorContext,
                    barrierDismissible: false,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: const Text('경고'),
                        content: const Text('관리자만 사용가능합니다'),
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
            },
            child: Text('사용자 관리')),
        IconButton(
            style: IconButton.styleFrom(iconSize: 30),
            onPressed: () {
              Navigator.push(navigatorContext, MaterialPageRoute(
                builder: (context) {
                  return Search_1();
                },
              ));
            },
            icon: Icon(Icons.search)),
        IconButton(
            style: IconButton.styleFrom(iconSize: 30),
            onPressed: () {
              Navigator.push(navigatorContext, MaterialPageRoute(
                builder: (context) {
                  return Invitation();
                },
              ));
            },
            icon: Icon(Icons.mail)),
      ],
    )
  ],
  automaticallyImplyLeading: false,
);
