import 'package:app_1/Page/Util/Search_1_page.dart';
import 'package:app_1/Page/Around/findaround.dart';
import 'package:app_1/Page/Info/myinfopage.dart';
import 'package:app_1/AppBar/appbar.dart';
import 'package:app_1/Page/Util/writepage.dart';
import 'package:app_1/Global/global.dart';
import 'package:flutter/material.dart';
import 'package:app_1/AppBar/bottomappbar.dart';
import 'package:app_1/Page/Util/viewtextpage.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    initNavigatorContext(context);
    setNavigatorContext(context);
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
          child: Scaffold(
              appBar: TopAppbar,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(navigatorContext)
                                    .push(PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) =>
                                          Write(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ));
                              },
                              child: Text(
                                '글쓰기',
                                style: TextStyle(fontSize: 20),
                              )),
                          alignment: Alignment.centerRight),
                    ),
                    Container(
                      width: MediaQuery.of(navigatorContext).size.width,
                      height: MediaQuery.of(navigatorContext).size.height * 0.72,
                      child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return ListTile(
                            contentPadding: EdgeInsets.only(left: 20, bottom: 20),
                            title: Align(
                              child: Text(
                                post.title,
                                style: TextStyle(fontSize: 20),
                              ),
                              alignment: Alignment.center,
                            ),
                            subtitle: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(post.author),
                                        Text(post.date),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 20)),
                                    Text(post.summary),
                                  ],
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Viewtext(index: index),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              bottomNavigationBar: BtmAppBar),
        ));
  }
}
