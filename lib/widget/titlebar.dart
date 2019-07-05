import 'package:flutter/material.dart';

///封装一些常用的标题栏，返回图标-文字，右菜单（文字、图标）
class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  Configuration configuration = new Configuration();

  ///设置标题文字，居中
  TitleBar.title(String title)
      : preferredSize = Size.fromHeight(kToolbarHeight) {
    configuration.title = title;
  }

  ///设置标题文字，居左
  TitleBar.leftTitle(String title)
      : preferredSize = Size.fromHeight(kToolbarHeight) {
    configuration.title = title;
    configuration.centerTitle = false;
  }

  ///设置标题，颜色和大小,背景颜色
  TitleBar.titleColorSize(
      String title, Color titleColor, double fontSize, Color background)
      : preferredSize = Size.fromHeight(kToolbarHeight) {
    configuration.title = title;
    configuration.centerTitle = true;
    configuration.titleColor = titleColor;
    configuration.fontSize = fontSize;
    configuration.backgoundColor = background;
  }

  TitleBar(Configuration configuration)
      : preferredSize = Size.fromHeight(kToolbarHeight) {
    this.configuration = configuration;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //返回图标
      leading: IconButton(
          icon: configuration.back,
          onPressed: () {
            Navigator.maybePop(context);
          }),
      title: Text(configuration.title,
          style: TextStyle(
              color: configuration.titleColor,
              fontSize: configuration.fontSize)),
      centerTitle: configuration.centerTitle,
      titleSpacing: 0.0,
      backgroundColor: configuration.backgoundColor,
      actions:
          //没有右图标
          configuration.rightIcon == null
              ? <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 18, right: 18),
                    child: Text(configuration.rightTitle),
                  )
                ]
              : <Widget>[
                  IconButton(
                    icon: configuration.rightIcon,
                    onPressed: configuration.clickIconMenu,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18, right: 18),
                    child: GestureDetector(
                      child: Text(configuration.rightTitle),
                      onTap: configuration.clickTitleMenu,
                    ),
                  )
                ],
    );
  }

  @override
  Size preferredSize;
}

class Configuration {
  //返回icon，See [Icon], [ImageIcon]
  Widget back = Icon(Icons.arrow_back_ios);
  String title;
  Color titleColor = Colors.black;
  double fontSize = 18;
  bool centerTitle = true;
  Color backgoundColor;

  //右菜单
  String rightTitle = "";

  //See [Icon], [ImageIcon]
  Widget rightIcon;

  VoidCallback clickIconMenu;
  VoidCallback clickTitleMenu;

  Configuration();

  ///点击右两个菜单回调
  Configuration.setOnMenuClickListener(
      {this.clickTitleMenu, this.clickIconMenu});
}
