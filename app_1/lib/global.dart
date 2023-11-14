import 'package:app_1/AppBar/bottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:app_1/Page/categorypage.dart';
import 'package:app_1/Page/findaround.dart';
import 'package:app_1/Page/homepage.dart';
import 'package:app_1/Page/myinfopage.dart';
import 'package:app_1/Page/recommendpage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio =Dio();
String baseUrl = "https://bengal-composed-steadily.ngrok-free.app";

class User{
  late String User_Local ='';
  late String User_Name='';
  late String User_Hobby='';
  late String User_ID='';
  late String User_PassWord='';
  late String User_Nic='';

  void set_Nic(String N){
    User_Nic =N;
  }
  void set_Local(String L){
    User_Local =L;
  }
  void set_Name(String N){
    User_Name = N;
  }
  void set_Hobby(String H){
    User_Hobby=H;
  }
  void set_ID(String I){
    User_ID = I;
  }
  void set_PassWord(String P){
    User_PassWord=P;
  }
  String get_Nic(){
    return User_Nic;
  }
  String get_Local(){
   return User_Local;
  }
  String get_Name(){
    return User_Name;
  }
  String get_Hobby(){
    return User_Hobby;
  }
  String get_ID(){
    return User_ID;
  }
  String get_PassWord(){
    return User_PassWord;
  }

}

class Post {
  final String title;
  final String content;
  final String author;
  final  String date;
  final String summary;
  Post({required this.title, required this.content, required this.author,required this.date,required this.summary});
}
final List<Post> posts = [
  Post(summary: '같이 볼링할사람 구합니다',title: '볼링 주말 초보모임', content: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', author: 'aaa', date:(DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 야구할사람 구합니다',title: '야구 동호회', content: '게시글 내용 2', author: 'bbb', date: (DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 축구할사람 구합니다',title: '축구 동호회', content: '게시글 내용 3', author: 'ccc', date:(DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 볼링할사람 구합니다',title: '볼링 동호회', content: '게시글 내용 1', author: 'aaa', date:(DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 야구할사람 구합니다',title: '야구 동호회', content: '게시글 내용 2', author: 'bbb', date: (DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 축구할사람 구합니다',title: '축구 동호회', content: '게시글 내용 3', author: 'ccc', date:(DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 볼링할사람 구합니다',title: '볼링 동호회', content: '게시글 내용 1', author: 'aaa', date:(DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 야구할사람 구합니다',title: '야구 동호회', content: '게시글 내용 2', author: 'bbb', date: (DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 축구할사람 구합니다',title: '축구 동호회', content: '게시글 내용 3', author: 'ccc', date:(DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 볼링할사람 구합니다',title: '볼링 동호회', content: '게시글 내용 1', author: 'aaa', date:(DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 야구할사람 구합니다',title: '야구 동호회', content: '게시글 내용 2', author: 'bbb', date: (DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 축구할사람 구합니다',title: '축구 동호회', content: '게시글 내용 3', author: 'ccc', date:(DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 볼링할사람 구합니다',title: '볼링 동호회', content: '게시글 내용 1', author: 'aaa', date:(DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 야구할사람 구합니다',title: '야구 동호회', content: '게시글 내용 2', author: 'bbb', date: (DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),
  Post(summary: '같이 축구할사람 구합니다',title: '축구 동호회', content: '게시글 내용 3', author: 'ccc', date:(DateTime.now().year.toString()+'-'+DateTime.now().month.toString()+'-'+DateTime.now().day.toString())),

];

late BuildContext navigatorContext;

User user = User();




