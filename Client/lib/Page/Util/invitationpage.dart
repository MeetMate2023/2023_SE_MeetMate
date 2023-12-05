import 'package:app_1/Global/global.dart';
import 'package:flutter/material.dart';

import '../Home/homepage.dart';

class Invitation extends StatefulWidget {
  const Invitation({super.key});

  @override
  State<Invitation> createState() => _InvitationState();
}

class _InvitationState extends State<Invitation> {
  _invitation_dialog(BuildContext context, var post) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(post['title']),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  Row(
                    children: [Text('보낸사람 : '), Text(post['nickname'])],
                  ),
                  Row(
                    children: [Text('할일 : '), Text(post['category'])],
                  ),
                  Row(
                    children: [Text('위치 : '), Text(post['local'])],
                  ),
                  Row(
                    children: [Text('일정 : '), Text(post['meetTime'])],
                  ),
                  Row(
                    children: [Text('오픈채팅: '), Text(post['chat'])],
                  ),
                ],
              ),
            ),
            actions: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        final options = {
                          "id": post['id'],
                        };
                        print(options);
                        dio
                            .post('$baseUrl/invitation/permit', data: options)
                            .then((value) => {Navigator.of(ctx).pop()});
                      },
                      child: Text('수락')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text('거절')),
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'My Invitations',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        toolbarHeight: 80,
        actions: [
          ElevatedButton(onPressed: (){
            final options = {
              "receiver" : user.User_ID
            };
            print(options);
            dio.post("$baseUrl/invitation/All_delete",data:options).then((value) =>
            {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Home();
            }))
            }

            );

          }, child: Text('전체삭제'))

        ],
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (var post in invit)
                  ListTile(
                    title: Container(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              child: Text(post['title']),
                              onPressed: () {
                                _invitation_dialog(context, post);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
