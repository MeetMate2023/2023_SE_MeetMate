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
  void register() {
    if (user.User_ID.isEmpty ||
        user.User_PassWord.isEmpty ||
        user.User_Name.isEmpty ||
        user.User_Nic.isEmpty ||
        user.User_Hobby.isEmpty ||
        user.User_Local.isEmpty) {
      print(user.get_ID());
      print(user.get_PassWord());
      print(user.get_Name());
      print(user.get_Nic());
      print(user.get_Hobby());
      print(user.get_Local());
      return;
    }
    final options = {
      "id": user.User_ID,
      "password": user.User_PassWord,
      "name": user.User_Name,
      "nickname": user.User_Nic,
      "hobby": user.User_Hobby,
      "local": user.User_Local,
      "company_check" : user.User_type,
    };
    print(options);
    dio
        .post("$baseUrl/join", data: options)
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('지역설정'),actions: [
          ElevatedButton(onPressed: () {
            register();
          }, child: Text('완료'))
          
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
                        child: Center(child: Text(regions[index])),
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
                      user.set_Local(detail_regions[current_index][index]);
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(child: Text(detail_regions[current_index][index])),
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
