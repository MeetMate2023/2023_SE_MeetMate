
import 'dart:ffi';

import 'package:app_1/global.dart';
import 'package:flutter/material.dart';
import 'package:app_1/Page/categorypage.dart';
import 'package:app_1/Page/findaround.dart';
import 'package:app_1/Page/myinfopage.dart';
import 'package:app_1/Page/recommendpage.dart';
import 'package:app_1/Page/homepage.dart';

 final Widget BtmAppBar = BottomAppBar(
    child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: (){
          Navigator.of(_navigatorContext)
              .push(PageRouteBuilder(pageBuilder:
              (context, animation, secondaryAnimation) => Category(), transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,));
        }, child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu),
            Text('카테고리')
          ],
        )),
        ElevatedButton(onPressed: (){
          Navigator.of(_navigatorContext)
              .push(PageRouteBuilder(pageBuilder:
              (context, animation, secondaryAnimation) => Recommend(), transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,)
          );
        }, child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.recommend),
            Text('추천 취미')
          ],
        )),
        ElevatedButton(
            onPressed: (){
          _CurrentContext = 'Home';
          Navigator.of(_navigatorContext)
              .push(PageRouteBuilder(pageBuilder:
              (context, animation, secondaryAnimation) => Home(), transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,));

        }, child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home),
            Text('홈')
          ],
        )),
        ElevatedButton(onPressed: (){
          Navigator.of(_navigatorContext)
              .push(PageRouteBuilder(pageBuilder:
              (context, animation, secondaryAnimation) => Around(), transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,));
        }, child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map),
            Text('내 주변 취미찾기')
          ],
        )),
        ElevatedButton(onPressed: (){
          _CurrentContext = 'Info';
          Navigator.of(_navigatorContext)
              .push(PageRouteBuilder(pageBuilder:
              (context, animation, secondaryAnimation) => Info(), transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,));
        }, child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.face),
            Text('내 정보')
          ],
        )),
      ],),
 );

   final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

   late BuildContext _navigatorContext;
   String _CurrentContext = '';
  initNavigatorContext(BuildContext context){
    _navigatorContext = context;
  }
  setNavigatorContext(BuildContext context) {
    if(context.widget.toString() != _CurrentContext){
      _navigatorContext = context;
    }
  }
 // 페이지 바텀앱바
