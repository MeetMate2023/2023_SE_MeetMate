import 'package:app_1/Page/categorypage.dart';
import 'package:app_1/Page/findaround.dart';
import 'package:app_1/Page/homepage.dart';
import 'package:app_1/Page/myinfopage.dart';
import 'package:app_1/Page/recommendpage.dart';
import 'package:app_1/AppBar/appbar.dart';
import 'package:app_1/global.dart';
import 'package:flutter/material.dart';
import 'package:app_1/AppBar/bottomappbar.dart';
class Recommend extends StatefulWidget {
  const Recommend({super.key});

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: TopAppbar,
            body: Container(),

          bottomNavigationBar: BtmAppBar
        ),
      ),
    );
  }
}
