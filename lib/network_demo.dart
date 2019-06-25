import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/movie_cell.dart';
import 'package:flutterdemo/model/movie.dart';
import 'package:flutterdemo/widget/titlebar.dart';
import 'package:fluttertoast/fluttertoast.dart';

///网络请求。
class NetworkDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyNetworkDemo();
  }
}

class _MyNetworkDemo extends State<NetworkDemo> {
  List<SubjectsListBean> movieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TitleBar.tilte("网络请求"),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MovieCell(movie: movieList[index]);
          },
          itemCount: movieList == null ? 0 : movieList.length,
        ));
  }

  @override
  void initState() {
    super.initState();
    _getMovie();
  }

  ///获取豆瓣电影排行榜Top250前20条电影
  _getMovie() async {
    try {
      Response response = await Dio().get(
          "https://api.douban.com/v2/movie/top250",
          data: {"start": 0, "count": 20});
      setState(() {
        movieList = Movie
            .fromMap(response.data)
            .subjects;
      });
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
