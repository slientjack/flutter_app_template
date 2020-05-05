import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void _pushPage() {
      print('push page');
      // 跳转，不隐藏tabbar，参数传递
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) {
            return DetailPage(name: 'Jack',);
          }
        )
      );
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Welcome to Flutter'),
        padding: EdgeInsetsDirectional.only(end: 0),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CupertinoButton(child: Icon(Icons.list, color: Colors.black), padding: EdgeInsets.all(8), onPressed: _pushPage),
            CupertinoButton(child: Icon(Icons.star, color: Colors.black), padding: EdgeInsets.all(8), onPressed: _pushPage),
          ],
        ),
      ),
      child: Center(
        child: Text('首页')
      ),
    );
  }
}