import 'package:app_1/Page/searchcategorypage.dart';
import 'package:app_1/hobbylist.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final _search_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('취미검색')),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.7,
              height: 50,
              child: TextField(controller: _search_controller),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: Hobbys.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Search(index: index),
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.25,
                      width: MediaQuery.of(context).size.width*0.25,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(child: Text(Hobbys[index])),
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
