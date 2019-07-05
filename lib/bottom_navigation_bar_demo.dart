import 'package:flutter/material.dart';
import 'package:flutterdemo/widget/titlebar.dart';

///底部导航
class BottomNavigationBarDemo extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() {
    return new _BottomNavigationBarState();
  }
}

class _BottomNavigationBarState extends State<BottomNavigationBarDemo> {
  int _selectedIndex = 0;
  var _tabLabel = ["首页", "消息", "发现", "我"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: TitleBar.title(_tabLabel[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text(_tabLabel[0])),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), title: Text(_tabLabel[1])),
          BottomNavigationBarItem(
              icon: Icon(Icons.find_in_page), title: Text(_tabLabel[2])),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account), title: Text(_tabLabel[3]))
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
