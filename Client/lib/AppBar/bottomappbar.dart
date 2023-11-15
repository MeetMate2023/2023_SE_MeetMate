
import 'dart:ffi';

import 'package:app_1/Page/Calender/calender.dart';
import 'package:app_1/Global/global.dart';
import 'package:flutter/material.dart';
import 'package:app_1/Page/Util/Search_1_page.dart';
import 'package:app_1/Page/Around/findaround.dart';
import 'package:app_1/Page/Info/myinfopage.dart';
import 'package:app_1/Page/Home/homepage.dart';

import '../Page/Category/category.dart';

 final Widget BtmAppBar = BottomAppBar(
    child:Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: (){
                _CurrentContext = 'Home';
                Navigator.of(navigatorContext)
                    .push(PageRouteBuilder(pageBuilder:
                    (context, animation, secondaryAnimation) => Home(), transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,));
              }, child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home),
              Text('홈',style: TextStyle(fontSize: 7),)
            ],
          )),
        ),
        Expanded(
          child: ElevatedButton(onPressed: (){
            Navigator.of(navigatorContext)
                .push(PageRouteBuilder(pageBuilder:
                (context, animation, secondaryAnimation) => Category(), transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,)
            );
          }, child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.storage),
              Text('카테고리',style: TextStyle(fontSize: 7))
            ],
          )),
        ),
        Expanded(
          child: ElevatedButton(
              onPressed: (){
            Navigator.of(navigatorContext)
                .push(PageRouteBuilder(pageBuilder:
                (context, animation, secondaryAnimation) => Around(), transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,));
          }, child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.map),
              Text('주변취미',style: TextStyle(fontSize: 7))
            ],
          )),
        ),
        Expanded(
          child: ElevatedButton(onPressed: (){
            _CurrentContext = 'Info';
            Navigator.of(navigatorContext)
                .push(PageRouteBuilder(pageBuilder:
                (context, animation, secondaryAnimation) => Calender(), transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,));
          }, child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_month_rounded),
              Text('일정',style: TextStyle(fontSize: 7))
            ],
          )),
        ),
        Expanded(
          child: ElevatedButton(onPressed: (){
            _CurrentContext = 'Info';
            Navigator.of(navigatorContext)
                .push(PageRouteBuilder(pageBuilder:
                (context, animation, secondaryAnimation) => Info(), transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,));
          }, child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.face),
              Text('내 정보',style: TextStyle(fontSize: 7))
            ],
          )),
        ),
      ],),
 );

 final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

String _CurrentContext = '';

initNavigatorContext(BuildContext context){
    navigatorContext = context;
  }
  setNavigatorContext(BuildContext context) {
    if(context.widget.toString() != _CurrentContext){
      navigatorContext = context;
    }
  }
 // 페이지 바텀앱바
