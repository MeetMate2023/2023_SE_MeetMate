// 취미와 동일
import 'package:app_1/Login/loginpage.dart';
import 'package:app_1/Global/global.dart';
import 'package:flutter/material.dart';
import 'package:app_1/Global/koreanlocal.dart';
class Local extends StatefulWidget {
  const Local({super.key});

  @override
  State<Local> createState() => _LocalState();
}
class _LocalState extends State<Local> {
  int current_index =0;
  int index =0;
  String picked_local = '';
  int max_select = 3;
  String iindex ='';
  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('오류.'),
            content: const Text('기업회원은 1개이상 선택해주세요.'),
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
  void add_local(String h,String i) {
    if(user.User_type){
      setState(() {
        max_select = 1;
      });
    } // 업체인지 검사, 업체면 1개
    setState(() {
      if (iindex.contains(i)) {
        picked_local = picked_local.replaceAll(h, '');
        iindex = iindex.replaceAll(i, '');
        index--;
      } else {
        if(index == max_select){
          return;
        }
        picked_local += h;
        iindex +=i;
        index++;
      }

    });
  }
  void register() {
    if (user.User_type&&index ==0) {
      _showDialog(context);
    }else {
      final options = {
        "uid": user.User_ID,
        "password": user.User_PassWord,
        "name": user.User_Name,
        "nickname": user.User_Nic,
        "hobby": user.User_Hobby,
        "local": user.User_Local,
        "company_check": user.User_type,
      };
      print(options);
      dio
          .post("$baseUrl/member/join", data: options)
          .then((result) async => {
                print(result),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                ),
              })
          .catchError((error) => {
                print(error),
              });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Row(
          children: [
            Text('지역 설정',
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(padding:  EdgeInsets.only(right: 20)),
            Text(picked_local,style: TextStyle(color: Colors.grey,fontSize: 10),)
          ],
        ),actions: [
          ElevatedButton(onPressed: () {
            register();
          }, child: Text('완료',
            style: TextStyle(fontSize: 18),
          ))
          
        ],),
        body: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height,
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: regions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print(index);
                        setState(() {
                          current_index = index;
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.1,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(child: Text(regions[index],
                          style: TextStyle(
                              fontSize: 20
                          ),)),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(child:
            ListView.builder(
              itemCount: detail_regions[current_index].length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      add_local(detail_regions[current_index][index]+' ',current_index.toString()+index.toString());
                      user.set_Local(picked_local);
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(
                          100, 96, 96, 96)),
                      color: iindex.contains(current_index.toString()+index.toString())
                          ? Color.fromRGBO(255, 242, 126, 1.0)
                          : null,
                      // 선택된 항목에 따라 배경 색상 변경
                    ),
                    child: Center(child: Text(detail_regions[current_index][index],
                      style: TextStyle(
                          fontSize: 20
                      ),)),
                  ),
                );
              },
            ),
            ),

          ],
        ),
      ),
    );
  }
}
