import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/model/register.dart';
import 'package:flutterdemo/util/common_util.dart';
import 'package:flutterdemo/widget/titlebar.dart';
import 'package:fluttertoast/fluttertoast.dart';

///注册
class RegisterDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RegisterStateDemo();
  }
}

class _RegisterStateDemo extends State<RegisterDemo> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  static const String URL = "http://10.1.10.143:8080/vote/account/register";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: TitleBar.title("注册"),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: _usernameController,
              decoration: new InputDecoration(
                  hintText: "用户名",
                  hintStyle: new TextStyle(color: Colors.black26, fontSize: 13),
                  icon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.5,
                  ))),
            ),
            new TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: new InputDecoration(
                  hintText: "密码",
                  hintStyle: new TextStyle(color: Colors.black26, fontSize: 13),
                  icon: Icon(Icons.lock, color: Colors.blue),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.5,
                  ))),
            ),
            new Row(
              children: <Widget>[
                Expanded(
                    child: new Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: new FlatButton(
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        _register(
                            _usernameController.text, _passwordController.text);
                      },
                      child: Text("注册")),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  ///注册
  _register(String username, String password) async {
    if (CommonUtil.isEmpty(username)) {
      Fluttertoast.showToast(msg: "请输入用户名");
      return;
    }
    if (CommonUtil.isEmpty(password)) {
      Fluttertoast.showToast(msg: "请输入密码");
      return;
    }
    try {
      Response response = await Dio().post(URL,
          data:
              new FormData.from({"username": username, "password": password}));
      Register login = Register.fromMap(response.data);
      if (login.code == 1) {
        Fluttertoast.showToast(msg: "注册成功");
        Navigator.pop(context);
      } else {
        Fluttertoast.showToast(msg: login.message);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "注册失败");
      print(e);
    }
  }
}
