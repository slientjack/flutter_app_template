import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_template/model/user_model.dart';
import 'package:flutter_app_template/cloud/cloud_api.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _phoneNumber = '';
  String _password = '';

  // 点击获取验证码
  void _onPressGetVcodeButton() {
    // 调用云端接口的示例
    CloudApi.getVcode(_phoneNumber, 1, 'zh_CN').then((resp) {
      print(resp.data);
    }).catchError((error) {
      print(error);
    });
  }

  // 点击登录按钮
  void _onPressLoginButton() {
    print({'account': _phoneNumber, 'password': _password});
    Provider.of<UserModel>(context).login();
  }

  @override
  Widget build(BuildContext context) {
    Container page = Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoTextField(
            placeholder: "请输入手机号",
          ),
          CupertinoTextField(
            placeholder: "请输入密码",
          ),
          CupertinoButton(
            child: Text('获取验证码'),
            onPressed: _onPressGetVcodeButton,
          ),
          CupertinoButton(
            child: Text('登录'),
            onPressed: _onPressLoginButton,
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: page
    );
  }
}