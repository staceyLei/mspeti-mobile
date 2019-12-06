import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SetUpState();
  }
}

class _SetUpState extends State<SetUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: style.bgColor,
        appBar: AppBar(
          backgroundColor: style.themeColor,
          centerTitle: true,
          title:
              Text('个人设置', style: TextStyle(color: Colors.white, fontSize: 20)),
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
              padding: EdgeInsets.all(15.0),
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
                            Text('小明', style: TextStyle(fontSize: 18.0)),
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
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.all(15.0),
                width: style.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top:Radius.circular(10.0)),
                ),
                child: InkWell(
                  onTap: (){
                    print('退出登录');
                  },
                  child: Row(
                  children: <Widget>[
                    Container(
                      width: 28,
                      height: 28,
                      child: Image.asset('assets/icon/back-exit.png',fit: BoxFit.contain,),
                    ),
                    SizedBox(width: 15.0,),
                    Text('退出登录',style:TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold)),
                  ],
                ),
              )
                
              ),
          ],
        ));
  }
}
