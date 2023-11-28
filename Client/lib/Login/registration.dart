import 'package:app_1/Login/registhobbypage.dart';
import 'package:app_1/Global/global.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final ID_Controller = TextEditingController();
  final Password_Controller = TextEditingController();
  final Name_Controller = TextEditingController();
  final Nicname_Controller = TextEditingController();
  bool id_check = false;
  bool nic_check = false;
  bool is_company = false;
 // => 전부 입력받을때 사용하는 컨트롤러
  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('오류'),
            content: const Text('모든 필드를 채워주세요'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('종료'),
              ),
            ],
          );
        });
  } // 빈 필드가 있을때 띄우는 경고창

  _check_available_id_Dialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(''),
            content: const Text('ID/닉네임 중복체크를 해주세요'),
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
  } // 충복체크 안햇을때 나오는 경고창

  _available_id_Dialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(''),
            content: const Text('사용 가능한 아이디입니다'),
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
  } // 사용가능한 아이디일때 나오는 알림창

  _available_nic_Dialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(''),
            content: const Text('사용 가능한 닉네임 입니다'),
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
  } // 사용가능한 닉네임일때 나오는 알림창

  _refuse_id_Dialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(''),
            content: const Text('사용 불가능한 아이디 입니다'),
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

  _refuse_nic_Dialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(''),
            content: const Text('중복된 닉네임 입니다'),
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

  void _checkd_id_uplication() { // id중복 체크
    final options = {"uid": ID_Controller.text};
    print(ID_Controller.text);
    dio.post("$baseUrl/member/id_check", data: options).then((result) async => {
          print(result.data.toString()),
          if (result.data)
            {
              _available_id_Dialog(context),
              setState(() {
                if(!id_check)
                id_check = !id_check;
              })
            }
          else
            {
              _refuse_id_Dialog(context),
            }
        });
  }

  void _checkd_nic_uplication() { // 닉네임 중복 체크
    final options = {"nickname": Nicname_Controller.text};
    dio.post("$baseUrl/member/nickname_check", data: options).then((result) async => {
          print(Nicname_Controller.text),
          print(result.data.toString()),
          if (result.data)
            {
              _available_nic_Dialog(context),
              setState(() {
                if(!nic_check)
                nic_check = !nic_check;
              })
            }
          else
            {
              _refuse_nic_Dialog(context),
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              child: Text(
                'Registration',
                style: TextStyle(fontSize: 30),
              ),
              alignment: Alignment(-0.8, 0),
            ),
            Row(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.83,
                    height: 50,
                    child: TextField(
                      controller: ID_Controller,
                      decoration: InputDecoration(labelText: 'ID'),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.17,
                  child: TextButton(
                    onPressed: () {
                      _checkd_id_uplication();
                    },
                    child: Text(
                      '중복확인',
                      style: TextStyle(fontSize: 10),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(
                        color: Colors.black,
                      )),
                    ),
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 2.5)),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextField(
                  controller: Password_Controller,
                  decoration: InputDecoration(labelText: 'password'),
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextField(
                  controller: Name_Controller,
                  decoration: InputDecoration(labelText: '이름(기업명)'),
                )),
            Row(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.83,
                    height: 50,
                    child: TextField(
                      controller: Nicname_Controller,
                      decoration: InputDecoration(labelText: '닉네임(기업명)'),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.17,
                  child: TextButton(
                    onPressed: () {
                      _checkd_nic_uplication();
                    },
                    child: Text(
                      '중복확인',
                      style: TextStyle(fontSize: 10),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(
                        color: Colors.black,
                      )),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text('기업회원'),
                Checkbox(
                    value: is_company,
                    onChanged: (bool? value) {
                      setState(() {
                        is_company = value!;
                      });
                    }),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 2.5)),
            ElevatedButton(
                onPressed: () {
                  if (ID_Controller.text.isEmpty ||
                      Name_Controller.text.isEmpty ||
                      Password_Controller.text.isEmpty ||
                      Nicname_Controller.text.isEmpty) {
                    _showDialog(context);
                    return;
                  } else if (!id_check || !nic_check) {
                    _check_available_id_Dialog(context);
                    return;
                  }
                  user.set_ID(ID_Controller.text);
                  user.set_Name(Name_Controller.text);
                  user.set_PassWord(Password_Controller.text);
                  user.set_Nic(Nicname_Controller.text);
                  user.set_Type(is_company);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Hobby();
                  }));
                }, // Next로 넘어가기전 필드에 적어놓은 정보 User에 저장
                child: Text('Next')),
          ],
        ),
      ),
    ));
  }
}
