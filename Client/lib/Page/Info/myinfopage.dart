import 'package:app_1/AppBar/appbar.dart';
import 'package:app_1/Global/global.dart';
import 'package:app_1/Page/Util/userchangeinfo.dart';
import 'package:flutter/material.dart';
import 'package:app_1/AppBar/bottomappbar.dart';

import '../../Login/loginpage.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  _member_Withdrawal(){
    final options = {
      "uid":user.User_ID,
    };
    print(options);
      dio.post('$baseUrl/member/delete',data: options).then((result){
        if(result.data){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        }
        else {print(user.User_ID);}

      } );
  }
  _withdrawal_dialog(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('MeetMate를 탈퇴하시겠습니까?', style: TextStyle(fontSize: 18),),
            content: Text('계정은 복구될 수 없으며, \n작성 글과 댓글, 모임 정보는 모두 삭제됩니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('아니오'),
              ),
              TextButton(
                onPressed: () {
                  _member_Withdrawal();
                },
                child: const Text('네'),
              ),
            ],
          );
        });
  }
  _check_dialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('로그아웃 하시겠습니까?', style: TextStyle(fontSize: 18),),
            content: Text(''),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('아니오'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: const Text('네'),
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
                  decoration:
                      BoxDecoration(color: Color.fromARGB(100, 237, 243, 250)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/person.jpg',
                              scale: 3,
                            ),
                          ),
                          // Padding(padding: EdgeInsets.only(right: 15)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                user.User_Nic,
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                user.User_Local,
                                style: TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                              Text(user.User_Hobby),
                            ],
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      ElevatedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => User_mo(),
                          ),
                        );
                      }, child: Text('회원 정보 수정'))
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _check_dialog(context);
                    },
                    child: Text('로그아웃')),
                SizedBox(height: 16),
                ElevatedButton(onPressed: (){
                  _withdrawal_dialog(context);
                }, child: Text('회원 탈퇴'))
              ],
            ),
            bottomNavigationBar: BtmAppBar),
      ),
    );
  }
}
