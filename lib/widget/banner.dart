import 'dart:async';

import 'package:flutter/material.dart';

/// 李双祥 on 2019/9/3.
/// 轮播图
class Banner extends StatefulWidget {
  final List<String> imageUrls;

  //图片点击事件
  final ValueChanged<int> onClick;
  //滑动事件
  final ValueChanged<int> onPageChange;

  final double width;
  final double height;
  //图标圆角
  final double corner;

  //自动播放
  final bool autoPlay;

  //播放间隔
  final int duration;

  Banner(
      {Key key,
      this.height,
      this.width,
      this.corner,
      this.imageUrls,
      this.onClick,
      this.onPageChange,
      this.autoPlay,
      this.duration})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return  _BannerState();
  }

}

class _BannerState extends State<Banner> {

  PageController _pageController = PageController();
  Timer timer;

  @override
  void initState() {
    super.initState();
    start();
  }

  start(){
    if(widget.autoPlay){
      var currentPage=0;
      timer=new Timer.periodic(new Duration(seconds: widget.duration),(timer){
          _pageController.animateToPage(currentPage%widget.imageUrls.length,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
          currentPage++;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        child: PageView.builder(
          itemBuilder: (context, index) {
            return ImageItem(
              corner: widget.corner,
              imageUrl: widget.imageUrls[index],
              onTap: () => widget.onClick(index),
            );
          },
          itemCount: widget.imageUrls.length,
          controller: _pageController,
          onPageChanged: widget.onPageChange,
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}

///图片
class ImageItem extends StatefulWidget {
  final VoidCallback onTap;
  final String imageUrl;
  final double corner;

  ImageItem({Key key, this.onTap, this.corner, this.imageUrl})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ImageItemState();
  }
}

class _ImageItemState extends State<ImageItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.imageUrl != null
          ? new ClipRRect(
              borderRadius: BorderRadius.circular(widget.corner),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ))
          : new SizedBox() ,
      onTap: widget.onTap,
    );
  }
}
