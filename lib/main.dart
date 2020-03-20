import 'package:dl_douban_app/pages/main/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '豆瓣APP',
      theme: ThemeData(
        primaryColor: Color(0xff25BE5E),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: DLDouBanMain(),
    );
  }
}
