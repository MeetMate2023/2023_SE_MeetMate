import 'package:app_1/Global/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Viewtext extends StatefulWidget {
  final int index;

  Viewtext({required this.index});

  @override
  _ViewtextState createState() => _ViewtextState();
}

class _ViewtextState extends State<Viewtext> {
  late Future<List<Map<String, dynamic>>> futureData;
  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('성공'),
            content: const Text('댓글 작성을 완료했습니다'),
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
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  final commentController = TextEditingController();

  Future<List<Map<String, dynamic>>> fetchData() async {
    final options = {
      "article_Index": widget.index,
    };
    print(options);
    print('22222');
    try {
      Response result = await dio.post("$baseUrl/comment_list", data: options);
      List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(result.data);
      print(data);
      return data;
    } catch (error) {
      print('공습경보!!');
      throw Exception('데이터를 불러오는 데 실패했습니다.');
    }
  }

  void postReview() {
    final options = {
      "article_Index": widget.index,
      "nickname": user.User_Nic,
      "content": commentController.text,
    };
    print(options);
    dio.post("$baseUrl/write", data: options).then(
          (result) {
        print(result);
        setState(() {
          futureData = fetchData();
           _showDialog(context);
           commentController.clear();
        });

          },
    ).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print('1');
          return Scaffold(
            appBar: AppBar(title: Text('로딩 중')),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          print('2');
          return Scaffold(
            appBar: AppBar(title: Text('에러')),
            body: Center(child: Text('데이터를 불러오는 도중 에러가 발생했습니다.')),
          );
        } else {
          print('3');
          reviewList = snapshot.data as List<Map<String, dynamic>>;

          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(title: Text(dataList[widget.index]['title'])),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dataList[widget.index]['title'],
                          style: TextStyle(fontSize: 30),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        Text(
                          dataList[widget.index]['content'],
                          style: TextStyle(fontSize: 25),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
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
                          ),
                        ),
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
                  Column(
                    children: List.generate(
                      reviewList.length,
                          (index) => ListTile(
                        title: Text(
                          '${reviewList[index]['nickname']}'': '
                              '${reviewList[index]['content']}',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              height: MediaQuery.of(context).viewInsets.bottom + 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50,
                    child: TextField(
                      decoration:
                      InputDecoration(hintText: "댓글을 입력하세요..."),
                      controller: commentController,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: IconButton(
                        onPressed: () {
                          postReview();
                        },
                        icon: Icon(Icons.send),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}