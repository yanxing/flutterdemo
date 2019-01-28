import 'package:flutter/material.dart';
import 'package:flutterdemo/widget/Blank.dart';

class WidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyWidgetDemo();
  }
}

class _MyWidgetDemo extends State<WidgetDemo> {
  String errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("一些控件"),
        centerTitle: false,
      ),
      body: Column(
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
                  hintStyle: new TextStyle(color: Colors.black26, fontSize: 13),
                  errorText: _inputErrorText()),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(15),
                  child: RaisedButton(
                      onPressed: () => {}, child: Text("RaisedButton"))),
              Padding(
                padding: EdgeInsets.only(left: 6),
                child:
                    FlatButton(onPressed: () => {}, child: Text("FlatButton")),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2),
                child: OutlineButton(
                    onPressed: () => {}, child: Text("OutlineButton")),
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
              Blank(width: 6),
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
              Blank(width: 15),
              Image(
                image: AssetImage("images/qt.jpg"),
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              )
            ],
          )
        ],
      ),
    );
  }

  _inputErrorText() {
    return errorText;
  }
}
