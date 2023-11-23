import 'package:app_1/Global/global.dart';
import 'package:flutter/material.dart';


class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
void g(){
  dio.get('https://0aa936c0-3d4f-4cc7-b164-a673c051fb69.mock.pstmn.io/list').then(
          (result) {
            print(result);
          }
  );
}
void p(){
  final options = {
    "a":1
  };
  dio.post('https://0aa936c0-3d4f-4cc7-b164-a673c051fb69.mock.pstmn.io/pppp').then((result){
    print(result);
    if(result.data){
      print("S");
    }
    else{
      print("F");
    }

  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('123'),
              onPressed: (){
                g();
              },
            ),
            ElevatedButton(
              child: Text('123'),
              onPressed: (){
                p();
              },
            ),

          ],
        ),
      )
    );


  }
}
