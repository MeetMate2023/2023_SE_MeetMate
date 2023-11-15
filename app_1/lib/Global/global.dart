import 'package:app_1/AppBar/bottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:app_1/Page/Util/Search_1_page.dart';
import 'package:app_1/Page/Around/findaround.dart';
import 'package:app_1/Page/Home/homepage.dart';
import 'package:app_1/Page/Info/myinfopage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio =Dio();
String baseUrl = "https://fond-stinkbug-simply.ngrok-free.app";

class User{
  late String User_Local ='';
  late String User_Name='';
  late String User_Hobby='';
  late String User_ID='';
  late String User_PassWord='';
  late String User_Nic='';
  late bool User_type;

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
  void set_Type(bool t){
    User_type=t;
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
  bool get_Type(){
    return User_type;
  }

}
late Future<List<Map<String, dynamic>>> futureDataList;
late List<Map<String, dynamic>> dataList;
late BuildContext navigatorContext;
late List<Map<String, dynamic>> reviewList;
User user = User();




