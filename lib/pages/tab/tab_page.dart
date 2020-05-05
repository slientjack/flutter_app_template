
import 'package:flutter_app_template/pages/home/home_page.dart';
import 'package:flutter_app_template/pages/mine/mine_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), title: Text('我')),
        ],
        activeColor: Color(0xFF81C722),
        inactiveColor: Color(0xFFC2CAD1),
        backgroundColor: Colors.white,
        iconSize: 24,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return HomePage(); break;
              case 1:
                return MinePage(); break;
            }
          },
        );
      },
    );
  }
  
}