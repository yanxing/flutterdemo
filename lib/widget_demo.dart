import 'package:flutter/material.dart';
import 'package:flutterdemo/widget/blank.dart';
import 'package:flutterdemo/widget/titlebar.dart';
import 'package:fluttertoast/fluttertoast.dart';

///一些Widget使用。
class WidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyWidgetDemo();
  }
}

class _MyWidgetDemo extends State<WidgetDemo> {
  String errorText;
  bool switchSelected = true;
  bool checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    Configuration configuration = new Configuration.setOnMenuClickListener(
        clickTitleMenu: () {
          Fluttertoast.showToast(msg: "点击了文字菜单");
        }, clickIconMenu: () {
      Fluttertoast.showToast(msg: "点击了图标菜单");
    });
    configuration.title = "一些控件";
    configuration.centerTitle = true;
    configuration.back = Icon(Icons.arrow_back_ios, color: Colors.black,);
    configuration.rightIcon = Icon(Icons.access_alarms);
    configuration.rightTitle = "菜单";
    return Scaffold(
      appBar:  TitleBar(configuration),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Text widget1",
                          style: new TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.blue),
                        )),
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: Text("Text widget2",
                            style: new TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.dashed))),
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: Text("Text widget3",
                            style: new TextStyle(
                                color: Colors.white,
                                background: new Paint()..color = Colors.red,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.dashed)))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: new TextField(
                    onSubmitted: (String text) {
                      setState(() {
                        if (text != "flutter") {
                          errorText = "error，you should input flutter";
                        }
                      });
                    },
                    decoration: new InputDecoration(
                        hintText: "please input flutter",
                        hintStyle:
                            new TextStyle(color: Colors.black26, fontSize: 13),
                        errorText: _inputErrorText()),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: RaisedButton(
                            onPressed: () => {}, child: Text("RaisedButton"))),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: FlatButton(
                          onPressed: () => {}, child: Text("FlatButton")),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: OutlineButton(
                          onPressed: () => {}, child: Text("OutlineButton")),
                    ),
                    Blank(width: 15),
                    FlatButton(
                      onPressed: () => {},
                      child: Text("自定义Button"),
                      color: Colors.red,
                      textColor: Colors.white,
                      highlightColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: IconButton(
                          icon: new Icon(
                            Icons.thumb_up,
                            color: Colors.blue,
                          ),
                          onPressed: () => {}),
                    ),
                    Blank(width: 15),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Image(
                        image: AssetImage("images/qt.jpg"),
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Blank(width: 15),
                    Switch(
                        value: switchSelected,
                        onChanged: (value) {
                          setState(() {
                            switchSelected = value;
                          });
                        }),
                    Checkbox(
                        value: checkboxSelected,
                        onChanged: (value) {
                          setState(() {
                            checkboxSelected = value;
                          });
                        })
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 50),
                      color: Colors.black,
                      child: new Transform(
                        alignment: Alignment.topRight,
                        transform: new Matrix4.skewY(0.3),
                        child: new Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.deepOrange,
                          child: const Text("Transform变换向Y轴倾斜"),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 50),
                      constraints:
                          BoxConstraints.tightFor(width: 100, height: 100),
                      decoration: BoxDecoration(
                          //背景装饰
                          gradient: RadialGradient(
                              colors: [Colors.red, Colors.orange],
                              center: Alignment.topLeft,
                              radius: 0.98),
                          boxShadow: [
                            //卡片阴影
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 4.0)
                          ]),
                      transform: Matrix4.rotationZ(0.2),
                      alignment: Alignment.center,
                      child: Text(
                        "卡片",
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  _inputErrorText() {
    return errorText;
  }
}
