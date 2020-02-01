import 'package:educationapp/pages/container/UserInfo/const.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/pages/components/NavLayout.dart';
import 'package:educationapp/assets/style.dart' as style;
// import 'package:image_picker/image_picker.dart';
import 'component/InfoItem.dart';

class UserInfo extends StatelessWidget {
  Widget _getContent(String key) {
    String value = userInfo[key];
    return value.isNotEmpty ? Text(value, style: style.secondFontStyle) : null;
  }

  Widget _getAuth() {
    String value = userInfo['phone'];
    bool isAuth = value.isNotEmpty;
    return Container(
      padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: isAuth ? style.successColor : style.warnColor),
      child: Text(isAuth ? '已绑定' : '未绑定',
          style: TextStyle(
              color: isAuth ? Colors.green : style.redColor,
              fontSize: style.sFontSize)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavLayout(
      title: '个人信息',
      backgroundColor: style.bgColor,
      components: <Widget>[
        SizedBox(
          height: 1,
        ),
        InfoItem(
          title: '头像',
          action: () async {
            // var image =
            //     await ImagePicker.pickImage(source: ImageSource.gallery);
            // print(image);
          },
          isModify: true,
          content: ClipOval(
            child: Image.asset(
              "assets/image/headImg.png",
              fit: BoxFit.cover,
              width: 36.0,
              height: 36.0,
            ),
          ),
        ),
        InfoItem(
          title: '姓名',
          content: _getContent("name"),
        ),
        InfoItem(
          title: '学号',
          content: _getContent("id"),
        ),
        InfoItem(
          title: '邮箱',
          isModify: true,
          action: () {
            print('modify email');
          },
          content: _getContent("email"),
        ),
        InfoItem(
          title: '联系方式',
          isModify: true,
          action: () {
            print('modify phone');
          },
          prefix: _getAuth(),
          content: _getContent("phone"),
        ),
      ],
    );
  }
}
