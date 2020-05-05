import 'package:flutter_app_template/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void _onPressedNext() {
      Navigator.of(context).push(CupertinoPageRoute(builder: (_) => SettingPage()));
    }

    void _onPressedName() {
      Provider.of<UserModel>(context).setName('HeHe');
      Navigator.of(context).pop();
    }

    void _onPressedLogout() {
      // 退出登录
      Provider.of<UserModel>(context).logout();
      // 返回根节点
      Navigator.of(context, rootNavigator: true).popUntil((route) => route.isFirst);
    }

    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(tag: 'img', child: Image(width: 100, height: 100, image: AssetImage('images/login/ico_login_account.png'))),
            Text('偏好设置'),
            CupertinoButton(
              child: Text('改个名字吧'),
              onPressed: _onPressedName,
            ),
            CupertinoButton(
              child: Text('再跳转一页'),
              onPressed: _onPressedNext,
            ),
            CupertinoButton(
              child: Text('退出登录'),
              onPressed: _onPressedLogout,
            ),
          ],
        )
      )
    );
  }
}