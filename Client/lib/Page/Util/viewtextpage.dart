import 'package:app_1/Global/global.dart';
import 'package:flutter/material.dart';

class Viewtext extends StatefulWidget {
  final int index;

  Viewtext({required this.index});

  @override
  _ViewtextState createState() => _ViewtextState();
}

class _ViewtextState extends State<Viewtext> {
  final comment_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text(posts[widget.index].title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    posts[widget.index].title,
                    style: TextStyle(fontSize: 30),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Text(
                    posts[widget.index].content,
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print('수정');
                              },
                              child: Text('수정'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                print('삭제');
                              },
                              child: Text('삭제'),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 5,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text('닉네임: ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄹ'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).viewInsets.bottom+60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: TextField(
              decoration: InputDecoration(hintText: "댓글을 입력하세요..."),
              controller: comment_controller),
            ),
            SizedBox(
                width: 50,
                child: IconButton(onPressed: (){print(comment_controller.text);}, icon: Icon(Icons.send)))
          ],
        ),
      ),
    );
  }
}
