import '../type.dart';

class User {
  String name;
  String phone;
  String userId;
  String headImg;
  bool isLogin;
  User({this.name, this.phone, this.userId, this.headImg,this.isLogin});
  User.init() {
    this.name = '';
    this.phone = '';
    this.userId = '';
    this.headImg = '';
    this.isLogin = false;
  }
}

User userReducer(state, action) {
  switch (action.type) {
    case Type.LOGIN_SUCCESS:
      return User(name: action.payload.name,isLogin: true);
      break;
    default:
      return state;
  }
}
