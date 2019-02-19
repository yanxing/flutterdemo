import 'package:flutter/material.dart';
import 'package:flutterdemo/my_drawer.dart';

///抽屉
class DrawerDemo extends StatefulWidget {
  @override
  _DrawerDemoState createState() {
    return new _DrawerDemoState();
  }
}

class _DrawerDemoState extends State<DrawerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("抽屉"),
        centerTitle: false,
      ),
      drawer: new MyDrawer(),
    );
  }
}
