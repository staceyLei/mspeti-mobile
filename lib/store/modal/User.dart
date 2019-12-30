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