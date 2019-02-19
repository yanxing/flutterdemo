import 'package:flutter/material.dart';
import 'package:flutterdemo/widget/Blank.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 20, top: 50),
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                          child: Image(
                        image: AssetImage("images/qt.jpg"),
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      )),
                      Blank(width: 15),
                      Text(
                        "yanxing",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Expanded(
                  child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text("添加账户"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("设置"),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
