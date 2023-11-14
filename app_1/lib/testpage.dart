import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String selectedCategory = '운동';
  String selectedSubCategory = '축구';

  final List<String> Hobbys = [
    '운동',
    '아웃도어/여행',
    '언어',
    '봉사활동',
    '댄스/무용',
    '문화/공연',
    '여가',
    '기타'
  ];

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

    return Scaffold(
      appBar: AppBar(
        title: Text('동적 콤보박스 예시'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
          ],
        ),
      ),
    );
  }
}
