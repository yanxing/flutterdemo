
///{
//    "count": 1,
//    "start": 0,
//    "total": 250,
//    "subjects": [
//        {
//            "rating": {
//                "max": 10,
//                "average": 9.6,
//                "stars": "50",
//                "min": 0
//            },
//            "genres": [
//                "犯罪",
//                "剧情"
//            ],
//            "title": "肖申克的救赎",
//            "casts": [
//                {
//                    "alt": "https://movie.douban.com/celebrity/1054521/",
//                    "avatars": {
//                        "small": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p17525.webp",
//                        "large": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p17525.webp",
//                        "medium": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p17525.webp"
//                    },
//                    "name": "蒂姆·罗宾斯",
//                    "id": "1054521"
//                },
//                {
//                    "alt": "https://movie.douban.com/celebrity/1054534/",
//                    "avatars": {
//                        "small": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p34642.webp",
//                        "large": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p34642.webp",
//                        "medium": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p34642.webp"
//                    },
//                    "name": "摩根·弗里曼",
//                    "id": "1054534"
//                },
//                {
//                    "alt": "https://movie.douban.com/celebrity/1041179/",
//                    "avatars": {
//                        "small": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p5837.webp",
//                        "large": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p5837.webp",
//                        "medium": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p5837.webp"
//                    },
//                    "name": "鲍勃·冈顿",
//                    "id": "1041179"
//                }
//            ],
//            "collect_count": 1622212,
//            "original_title": "The Shawshank Redemption",
//            "subtype": "movie",
//            "directors": [
//                {
//                    "alt": "https://movie.douban.com/celebrity/1047973/",
//                    "avatars": {
//                        "small": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p230.webp",
//                        "large": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p230.webp",
//                        "medium": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p230.webp"
//                    },
//                    "name": "弗兰克·德拉邦特",
//                    "id": "1047973"
//                }
//            ],
//            "year": "1994",
//            "images": {
//                "small": "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp",
//                "large": "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp",
//                "medium": "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp"
//            },
//            "alt": "https://movie.douban.com/subject/1292052/",
//            "id": "1292052"
//        }
//    ],
//    "title": "豆瓣电影Top250"
//}
class Movie {
  String title;
  int count;
  int start;
  int total;
  List<SubjectsListBean> subjects;

  static Movie fromMap(Map<String, dynamic> map) {
    Movie temp = new Movie();
    temp.title = map['title'];
    temp.count = map['count'];
    temp.start = map['start'];
    temp.total = map['total'];
    temp.subjects = SubjectsListBean.fromMapList(map['subjects']);
    return temp;
  }

  static List<Movie> fromMapList(dynamic mapList) {
    List<Movie> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class SubjectsListBean {
  String title;
  String original_title;
  String subtype;
  String year;
  String alt;
  String id;
  int collect_count;
  ImagesBean images;
  RatingBean rating;
  List<String> genres;
  List<CastsListBean> casts;
  List<DirectorsListBean> directors;

  static SubjectsListBean fromMap(Map<String, dynamic> map) {
    SubjectsListBean subjectsListBean = new SubjectsListBean();
    subjectsListBean.title = map['title'];
    subjectsListBean.original_title = map['original_title'];
    subjectsListBean.subtype = map['subtype'];
    subjectsListBean.year = map['year'];
    subjectsListBean.alt = map['alt'];
    subjectsListBean.id = map['id'];
    subjectsListBean.collect_count = map['collect_count'];
    subjectsListBean.images = ImagesBean.fromMap(map['images']);
    subjectsListBean.rating = RatingBean.fromMap(map['rating']);
    subjectsListBean.casts = CastsListBean.fromMapList(map['casts']);
    subjectsListBean.directors = DirectorsListBean.fromMapList(map['directors']);

    List<dynamic> dynamicList0 = map['genres'];
    subjectsListBean.genres = new List();
    subjectsListBean.genres.addAll(dynamicList0.map((o) => o.toString()));

    return subjectsListBean;
  }

  static List<SubjectsListBean> fromMapList(dynamic mapList) {
    List<SubjectsListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class ImagesBean {
  String small;
  String large;
  String medium;

  static ImagesBean fromMap(Map<String, dynamic> map) {
    ImagesBean imagesBean = new ImagesBean();
    imagesBean.small = map['small'];
    imagesBean.large = map['large'];
    imagesBean.medium = map['medium'];
    return imagesBean;
  }

  static List<ImagesBean> fromMapList(dynamic mapList) {
    List<ImagesBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class RatingBean {
  String stars;
  double average;
  int max;
  int min;

  static RatingBean fromMap(Map<String, dynamic> map) {
    RatingBean ratingBean = new RatingBean();
    ratingBean.stars = map['stars'];
    ratingBean.average = map['average'];
    ratingBean.max = map['max'];
    ratingBean.min = map['min'];
    return ratingBean;
  }

  static List<RatingBean> fromMapList(dynamic mapList) {
    List<RatingBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class CastsListBean {
  String alt;
  String name;
  String id;
  AvatarsBean avatars;

  static CastsListBean fromMap(Map<String, dynamic> map) {
    CastsListBean castsListBean = new CastsListBean();
    castsListBean.alt = map['alt'];
    castsListBean.name = map['name'];
    castsListBean.id = map['id'];
    castsListBean.avatars = AvatarsBean.fromMap(map['avatars']);
    return castsListBean;
  }

  static List<CastsListBean> fromMapList(dynamic mapList) {
    List<CastsListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class DirectorsListBean {
  String alt;
  String name;
  String id;
  AvatarsBean avatars;

  static DirectorsListBean fromMap(Map<String, dynamic> map) {
    DirectorsListBean directorsListBean = new DirectorsListBean();
    directorsListBean.alt = map['alt'];
    directorsListBean.name = map['name'];
    directorsListBean.id = map['id'];
    directorsListBean.avatars = AvatarsBean.fromMap(map['avatars']);
    return directorsListBean;
  }

  static List<DirectorsListBean> fromMapList(dynamic mapList) {
    List<DirectorsListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class AvatarsBean {
  String small;
  String large;
  String medium;

  static AvatarsBean fromMap(Map<String, dynamic> map) {
    AvatarsBean avatarsBean = new AvatarsBean();
    avatarsBean.small = map['small'];
    avatarsBean.large = map['large'];
    avatarsBean.medium = map['medium'];
    return avatarsBean;
  }

  static List<AvatarsBean> fromMapList(dynamic mapList) {
    List<AvatarsBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
