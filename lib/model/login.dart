class Login {

  /**
   * code : 1
   * data : {"id":1,"username":"123","password":"123","type":1}
   */

  String message;
  int code;
  DataBean data;

  static Login fromMap(Map<String, dynamic> map) {
    Login login = new Login();
    login.message = map['message'];
    login.code = map['code'];
    login.data = DataBean.fromMap(map['data']);
    return login;
  }

  static List<Login> fromMapList(dynamic mapList) {
    List<Login> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class DataBean {

  /**
   * username : "123"
   * password : "123"
   * id : 1
   * type : 1
   */

  String username;
  String password;
  int id;
  int type;

  static DataBean fromMap(Map<String, dynamic> map) {
    DataBean dataBean = new DataBean();
    dataBean.username = map['username'];
    dataBean.password = map['password'];
    dataBean.id = map['id'];
    dataBean.type = map['type'];
    return dataBean;
  }

  static List<DataBean> fromMapList(dynamic mapList) {
    List<DataBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
