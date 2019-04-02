class Register {

  /**
   * code : 0
   */

  String message;
  int code;

  static Register fromMap(Map<String, dynamic> map) {
    Register register = new Register();
    register.message = map['message'];
    register.code = map['code'];
    return register;
  }

  static List<Register> fromMapList(dynamic mapList) {
    List<Register> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}
