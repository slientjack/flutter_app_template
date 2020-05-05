import 'package:flutter_app_template/model/user_model.dart';
import 'package:flutter_app_template/pages/mine/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void _onPressedSetting() {
      // 跳转，隐藏tabbar
      Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (_) => SettingPage()));
    }

    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(Provider.of<UserModel>(context).name),
            CupertinoButton(
              child: Text('偏好设置'),
              onPressed: _onPressedSetting,
            ),
            Hero(tag: 'img', child: Image(width: 30, height: 30, image: AssetImage('images/login/ico_login_account.png')))
          ]
        )
      )
    );
  }
}