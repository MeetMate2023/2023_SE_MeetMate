import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String nickname;
  final String location;
  final String hobbys;
  Profile({required this.nickname,required this.location,required this.hobbys});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('프로필보기')),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.3,
          decoration: BoxDecoration(color: Color.fromARGB(100, 237, 243, 250)),
          child: Column(
            children: [
              Text('${widget.nickname}',style: TextStyle(fontSize: 30),),
              Text('위치',style: TextStyle(fontSize: 30)),
              Text('${widget.location}',style: TextStyle(fontSize: 25)),
              Text('취미',style: TextStyle(fontSize: 30)),
              Text('${widget.hobbys}',style: TextStyle(fontSize: 25)),
            ],
          ),
        ),
      ),
    ));
  }
}
