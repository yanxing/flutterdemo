import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdemo/model/movie.dart';
import 'package:flutterdemo/widget/blank.dart';

class MovieCell extends StatelessWidget {
  final SubjectsListBean movie;

  MovieCell({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Image(
            image: NetworkImage(movie.images.medium),
            fit: BoxFit.cover,
            width: 96,
            height: 108,
          ),
          Blank(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(movie.title,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold)),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "评分：",
                    style: TextStyle(color: Colors.black54, fontSize: 15)),
                TextSpan(
                    text: movie.rating.average.toString(),
                    style: TextStyle(color: Colors.blue))
              ])),
              Text('导演：${movie.directors[0]?.name}',
                  style: TextStyle(fontSize: 13, color: Colors.black26)),
              Text('主演：${movie.casts[0]?.name}',
                  style: TextStyle(fontSize: 13, color: Colors.black26)),
              Text('上映年份：${movie.year}',
                  style: TextStyle(fontSize: 13, color: Colors.black26))
            ],
          )
        ],
      ),
    );
  }
}
