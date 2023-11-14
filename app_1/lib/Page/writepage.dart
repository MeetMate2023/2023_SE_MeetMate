import 'package:flutter/material.dart';

import '../hobbylist.dart';

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  String selectedCategory = '운동';
  String selectedSubCategory = '축구';
  final detailHobbys = {
    '운동': ['축구', '야구', '농구', '배구', '수영', '테니스', '배드민턴'],
    '아웃도어/여행': ['등산', '트래킹', '캠핑', '국내여행', '해외여행', '낚시'],
    '언어': ['영어', '일본어', '중국어', '스페인어', '어..?'],
    '봉사활동': ['양로원', '보육원', '환경봉사', '사회봉사', '교육', '동물'],
    '댄스/무용': ['발레', '한국무용', '재즈', '힙합', '비보잉'],
    '문화/공연': ['뮤지컬', '공연', '영화', '전시회', '박물관'],
    '여가': ['뭘', '넣', '어', '야', '할', '까'],
    '기타': ['기타']
  };
  List<String> getSubCategories(String category) {
    return detailHobbys[category] ?? [];
  }


  @override
  Widget build(BuildContext context) {
    List<String> subCategories = getSubCategories(selectedCategory);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('글쓰기'),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            SizedBox(
                width: MediaQuery.of(context).size.width*0.75,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),labelText: '제목'),),
            ),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                  width: MediaQuery.of(context).size.width*0.75,
                  height: 70,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('카테고리  '),
                        DropdownButton<String>(
                          value: selectedCategory,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                              subCategories = getSubCategories(selectedCategory);
                              selectedSubCategory = subCategories.isNotEmpty ? subCategories[0] : ''; // 초기값 설정
                            });
                          },
                          items: Hobbys.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 20.0),
                        DropdownButton<String>(
                          value: selectedSubCategory,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedSubCategory = newValue!;
                            });
                          },
                          items: subCategories.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ]),
                ),
            SizedBox(
                width: MediaQuery.of(context).size.width*0.75,
                height: MediaQuery.of(context).size.height*0.5,
                child: TextField(
                  expands: true,
                  maxLines: null,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),labelText: '내용'),)),
                ElevatedButton(onPressed: (){}, child: Text('글쓰기'))
          ]),
        ),
      )),
    );
  }
}
