import 'package:flutter/material.dart';

import '../../AppBar/appbar.dart';
import '../../AppBar/bottomappbar.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(child: Scaffold(
        appBar: TopAppbar,
        body: Container(
          width: MediaQuery.of(context).size .width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.red),
        ),
        bottomNavigationBar: BtmAppBar,
      )),
    );
  }
}
