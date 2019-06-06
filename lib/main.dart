import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutterdemo/bottom_navigation_bar_demo.dart';
import 'package:flutterdemo/drawer_demo.dart';
import 'package:flutterdemo/login_demo.dart';
import 'package:flutterdemo/network_demo.dart';
import 'package:flutterdemo/tab_bar_view_demo.dart';
import 'package:flutterdemo/widget_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      ///是否显示右上角debug标志，默认显示
//      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Colors.white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      builder: FlutterBoost.init(postPush: _onRoutePushed),
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {}
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
      ),
      body: new ListView(children: _initListData()),
    );
  }

  @override
  void initState() {
    super.initState();
    FlutterBoost.singleton.registerPageBuilders({
      'sample://firstPage': (pageName, params, _) {
        print("flutterPage params:$params");
        return MyHomePage(title: 'Flutter Demo');
      },
      'sample://secondPage': (pageName, params, _) => BottomNavigationBarDemo(),
    });
    FlutterBoost.handleOnStartPage();
  }

  _initListData() {
    List<Widget> list = [];
    list.add(_customButton("一些控件", 1));
    list.add(_customButton("底部导航", 2));
    list.add(_customButton("抽屉", 3));
    list.add(_customButton("tab滑动菜单", 4));
    list.add(_customButton("列表", 5));
    list.add(_customButton("注册登录", 6));
    return list;
  }

  _customButton(String title, int type) {
    return new Padding(
        padding: (type == 1
            ? new EdgeInsets.only(
                left: 20.0, top: 25.0, right: 20.0, bottom: 5.0)
            : new EdgeInsets.symmetric(vertical: (5), horizontal: 20)),
        child: FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text(title),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: () => _onClick(type),
        ));
  }

  _onClick(int type) {
    if (type == 1) {
      //一些控件
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WidgetDemo()),
      );
    } else if (type == 2) {
      //底部导航
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarDemo()),
      );
    } else if (type == 3) {
      //抽屉
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DrawerDemo()),
      );
    } else if (type == 4) {
      //tab滑动菜单
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabBarViewDemo()),
      );
    } else if (type == 5) {
      //列表demo
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NetworkDemo()),
      );
    } else if (type == 6) {
      //注册登录
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginDemo()),
      );
    }
  }
}
