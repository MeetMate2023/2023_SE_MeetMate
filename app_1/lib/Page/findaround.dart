import 'package:app_1/Page/categorypage.dart';
import 'package:app_1/Page/findaround.dart';
import 'package:app_1/Page/homepage.dart';
import 'package:app_1/Page/myinfopage.dart';
import 'package:app_1/Page/recommendpage.dart';
import 'package:app_1/AppBar/appbar.dart';
import 'package:app_1/global.dart';
import 'package:flutter/material.dart';
import 'package:app_1/AppBar/bottomappbar.dart';
class Around extends StatefulWidget {
  const Around({super.key});

  @override
  State<Around> createState() => _AroundState();
}

class _AroundState extends State<Around> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: TopAppbar,
            body: SizedBox(
              width: MediaQuery.of(context).size.width*0.2,
              height: 100,
              child: ElevatedButton(
                onPressed: (){print('asdf');},
                child: Text('aa'),
              ),

            ),
            bottomNavigationBar: BtmAppBar

        ),
      ),
    );
  }
}
