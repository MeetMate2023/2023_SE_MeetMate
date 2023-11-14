import 'package:app_1/global.dart';
import 'package:flutter/material.dart';

Container bulletin = Container(
  width: MediaQuery
      .of(navigatorContext)
      .size
      .width,
  height: MediaQuery
      .of(navigatorContext)
      .size
      .height*0.8,
  child: ListView.builder(
    itemCount: posts.length,
    itemBuilder: (context, index) {
      final post = posts[index];
      return ListTile(
        contentPadding: EdgeInsets.only(left: 20,bottom: 20),
        title: Align(child: Text(post.title, style: TextStyle(fontSize: 20),),
          alignment: Alignment.center,),
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
          print(post.title);
        },
      );
    },
  ),
);
