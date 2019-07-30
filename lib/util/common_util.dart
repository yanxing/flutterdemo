
import 'package:flutter/material.dart';

///工具类
class CommonUtil {

  ///字符串是否为空
  static bool isEmpty(String content) {
    if (content == null || content.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  ///获取屏幕信息
  static Size getScreenSize(BuildContext context){
      return MediaQuery.of(context).size;
  }
}
