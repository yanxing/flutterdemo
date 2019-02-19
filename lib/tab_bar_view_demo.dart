import 'package:flutter/material.dart';

///TabBarView
class TabBarViewDemo extends StatefulWidget {
  @override
  _TabBarViewDemoState createState() {
    return new _TabBarViewDemoState();
  }
}

class _TabBarViewDemoState extends State<TabBarViewDemo>
    with SingleTickerProviderStateMixin {
  List _tabs = ["tab1", "tab2", "tab3"];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("TabBarView"),
          centerTitle: false,
          bottom: TabBar(
            controller: _tabController,
            tabs: _tabs.map((e) {
              return (new Tab(text: e));
            }).toList(),
          )),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 5,
            ),
          );
        }).toList(),
      ),
    );
  }
}
