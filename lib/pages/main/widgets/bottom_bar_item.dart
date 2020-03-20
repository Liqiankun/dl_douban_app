import 'package:flutter/material.dart';

class DLBottomBarItem extends BottomNavigationBarItem {
  DLBottomBarItem(String iconName, String title)
      : super(
          title: Text(title),
          icon: Image.asset('assets/tabbar/$iconName.png', width: 32),
          activeIcon:
              Image.asset('assets/tabbar/${iconName}_active.png', width: 32),
        );
}
