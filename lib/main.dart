import 'package:flutter_app_template/model/user_model.dart';
import 'package:flutter_app_template/pages/tab/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'pages/login/login_page.dart';

void main() => runApp(ChangeNotifierProvider<UserModel>(
  create: (BuildContext context) => UserModel(),
  child: MyApp(), 
));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    if (Provider.of<UserModel>(context).isLogin) {
      return CupertinoApp(home: TabPage());
    } else {
      return CupertinoApp(home: LoginPage());
    }
  }
}