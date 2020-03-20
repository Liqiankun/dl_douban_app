import 'package:dl_douban_app/pages/home/home.dart';
import 'package:dl_douban_app/pages/main/widgets/bottom_bar_item.dart';
import 'package:flutter/material.dart';

class DLDouBanMain extends StatefulWidget {
  DLDouBanMain({Key key}) : super(key: key);

  @override
  _DLDouBanMainState createState() => _DLDouBanMainState();
}

class _DLDouBanMainState extends State<DLDouBanMain> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomePage(),
          Center(
            child: Text('Project Page'),
          ),
          Center(
            child: Text('Mall Page'),
          ),
          Center(
            child: Text('Group Page'),
          ),
          Center(
            child: Text('Profile Page'),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: <DLBottomBarItem>[
            DLBottomBarItem('home', '首页'),
            DLBottomBarItem('subject', '书影音'),
            DLBottomBarItem('group', '小组'),
            DLBottomBarItem('mall', '集市'),
            DLBottomBarItem('profile', '我的'),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
