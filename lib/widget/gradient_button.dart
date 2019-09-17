import 'package:flutter/material.dart';

/// 李双祥 on 2019/9/17.

/// 渐变按钮
class GradientButton extends StatelessWidget {
  ///渐变开始颜色
  final Color startColor;

  ///渐变结束颜色
  final Color endColor;

  ///圆角
  final double radius;

  final BoxBorder border;

  ///按钮文本
  final String text;

  ///文字颜色
  final Color textColor;

  ///文字大小
  final double fontSize;

  ///文字边距
  final EdgeInsetsGeometry padding;

  final VoidCallback onClick;

  GradientButton(
      {Key key,
      this.text,
      this.textColor,
      this.fontSize,
      this.startColor,
      this.endColor,
      this.padding,
      this.border,
      this.radius,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          //边框
          border: border == null
              ? Border.all(color: Colors.transparent, width: 0)
              : border,
          //渐变
          gradient: LinearGradient(colors: [startColor, endColor]),
          //圆角
          borderRadius: BorderRadius.circular(radius == null ? 0 : radius)),
      child: GestureDetector(
        child: Padding(
          padding: padding == null
              ? EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2)
              : padding,
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize == null ? 14 : fontSize,
                color: textColor == null ? Colors.black : textColor),
          ),
        ),
        onTap: onClick,
      ),
    );
  }
}
