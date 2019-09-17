import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 李双祥 on 2019/9/11.

///跑马灯效果，两行向上
class MarqueeWidget extends StatefulWidget {
  final List<String> datas;
  final double height;
  final ValueChanged<int> onClick;

  MarqueeWidget(
      {Key key, @required this.datas, @required this.height, this.onClick})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MarqueeWidgetState();
  }
}

class _MarqueeWidgetState extends State<MarqueeWidget> {
  Timer timer;
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return TextItem(
              data: widget.datas[index], onTap: () => widget.onClick(index));
        },
        itemCount: widget.datas == null ? 0 : widget.datas.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 8),
        controller: scrollController,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  void start() {
    //小于3个不滚动
    if (widget.datas == null || widget.datas.length <= 2) {
      return;
    }
    var moveDistance = 0.0;
    timer = new Timer.periodic(new Duration(seconds: 2), (timer) {
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      //已经移动的距离
      double pixels = scrollController.position.pixels;
      if (pixels >= maxScrollExtent) {
        scrollController.jumpTo(-maxScrollExtent);
        moveDistance = 0;
      }
      moveDistance += moveDistance + widget.height;
      scrollController.animateTo(moveDistance,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    });
  }
}

///文字
class TextItem extends StatefulWidget {
  final String data;
  final VoidCallback onTap;

  TextItem({Key key, this.data, this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextItem();
  }
}

class _TextItem extends State<TextItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        widget.data,
        style: TextStyle(
            fontSize: 13,
            fontStyle: FontStyle.normal,
            color: Colors.black45),
      ),
      onTap: widget.onTap,
    );
  }
}
