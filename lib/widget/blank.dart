import 'package:flutter/material.dart';

///占位
class Blank extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  Blank(
      {Key key,
      this.height = 10,
      this.width = 10,
      this.color = const Color(0xFFFAFAFA)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width, height: height, child: Container(color: color));
  }
}
