import 'package:app_1/global.dart';
import 'package:flutter/material.dart';

class Viewtext extends StatefulWidget {
  final int index;

  Viewtext({required this.index});
  @override
  _ViewtextState createState() => _ViewtextState();
}

class _ViewtextState extends State<Viewtext> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(posts[widget.index].title)),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*2,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(border:
                  Border(bottom:
                  BorderSide(
                      color: Colors.grey,
                      width: 5,
                  ))),
                  width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(posts[widget.index].title,style: TextStyle(fontSize: 30),),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        Text(posts[widget.index].content,style: TextStyle(fontSize: 25),),
                      ],
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text('닉네임: ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄹ'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}