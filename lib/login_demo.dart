import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/model/login.dart';
import 'package:flutterdemo/register_demo.dart';
import 'package:flutterdemo/util/comment_util.dart';
import 'package:flutterdemo/widget/titlebar.dart';
import 'package:fluttertoast/fluttertoast.dart';

///登录
class LoginDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginStateDemo();
  }
}

class _LoginStateDemo extends State<LoginDemo> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  static const String URL = "http://10.1.10.143:8080/vote/account/login";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:TitleBar.title("登录"),
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
            new GestureDetector(
              //padding: EdgeInsets.only(top: 10),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "注册",
                      style: new TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterDemo()),
                );
              },
            ),
            new Row(
              children: <Widget>[
                Expanded(
                    child: new Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: new FlatButton(
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        _login(
                            _usernameController.text, _passwordController.text);
                      },
                      child: Text("登录")),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  ///登录
  _login(String username, String password) async {
    if (CommentUtil.isEmpty(username)) {
      Fluttertoast.showToast(msg: "请输入用户名");
      return;
    }
    if (CommentUtil.isEmpty(password)) {
      Fluttertoast.showToast(msg: "请输入密码");
      return;
    }
    try {
      Response response = await Dio().post(URL,
          data:
              new FormData.from({"username": username, "password": password}));
      Login login = Login.fromMap(response.data);
      print(login);
      if (login.code == 1) {
        Fluttertoast.showToast(msg: "登录成功");
      } else {
        Fluttertoast.showToast(msg: login.message);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "登录失败");
      print(e);
    }
  }
}
