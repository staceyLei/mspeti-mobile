import 'package:flutter_redux/flutter_redux.dart';
import 'package:educationapp/store/modal/User.dart';
import 'package:educationapp/store/store.dart';
import 'package:educationapp/store/action/userAction.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/pages/components/BaseButton.dart';

class SetUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SetUpState();
  }
}

class _SetUpState extends State<SetUp> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<MainState, User>(
      converter: (store) => store.state.user,
      builder: (BuildContext context, User user) {
        return Scaffold(
            backgroundColor: style.bgColor,
            appBar: AppBar(
              centerTitle: true,
              title: Text('个人设置',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              leading: IconButton(
                icon: Image.asset('assets/icon/arrow-left-white.png'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Column(
              children: <Widget>[
                Container(
                  width: style.width,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10.0)),
                  ),
                  child: InkWell(
                    onTap: () {
                      print('修改信息');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ClipOval(
                                  child: Image.asset(
                                    "assets/image/headImg.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(user.name,
                                    style: TextStyle(fontSize: 18.0)),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                BaseButton(title: '退出登录',onTap: (){
                   UserAction.toLogOut();
                        Navigator.pushNamed(context, '/Login');
                },),
              ],
            ));
      },
    );
  }
}
