import 'package:educationapp/pages/container/Tab/ShopCart/ShopCart.dart';
import 'package:educationapp/provider/ShopCartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Course/Course.dart';
import 'Message/Message.dart';
import 'MyCenter/MyCenter.dart';
import 'HomePage/HomePage.dart';
import 'package:educationapp/assets/style.dart' as style;

class TabsIcon extends StatelessWidget {
  final String imgUrl;
  final bool isShopCart;
  TabsIcon(this.imgUrl, {this.isShopCart = false});
  @override
  Widget build(BuildContext context) {
    if (isShopCart) {
      return Stack(children: [
        Container(
          height: 27.0,
          width: 29.0,
          padding: EdgeInsets.fromLTRB(0, 3, 5, 0),
          child: Image.asset(imgUrl),
        ),
        Positioned(
          child: Container(
              alignment: Alignment.center,
              width: 13,
              height: 13,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6.5),
              ),
              child: Builder(builder: (_) {
                return Consumer<ShopCartProvider>(
                  builder: (_, shopCart, e) {
                    return Text(shopCart.shopCartNum.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 10));
                  },
                );
              })),
          right: 0,
          top: 0,
        )
      ]);
    }
    return Container(
      height: 24.0,
      width: 24.0,
      child: Image.asset(imgUrl),
    );
  }
}

class Tabs extends StatefulWidget {
  final arguments;
  Tabs({Key key, this.arguments}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    var currentIndex = arguments == null ? 0 : arguments['currentIndex'];
    return _TabsState(currentIndex: currentIndex);
  }
}

class _TabsState extends State<Tabs> {
  var pages = [
    HomePage(),
    Course(),
    // Message(),
    ShopCart(),
    MyCenter(),
  ];
  int _currentIndex;
  _changeIndex(v) {
    setState(() {
      _currentIndex = v;
    });
  }

  _TabsState({int currentIndex}) {
    this._currentIndex = currentIndex;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: this._changeIndex,
        currentIndex: this._currentIndex,
        unselectedItemColor: Colors.black,
        unselectedFontSize: 14.0,
        selectedFontSize: 14.0,
        type: BottomNavigationBarType.fixed,
        iconSize: 24.0,
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: TabsIcon("assets/icon/home.png"),
            activeIcon: TabsIcon("assets/icon/home-active.png"),
          ),
          BottomNavigationBarItem(
            title: Text('课程'),
            icon: TabsIcon("assets/icon/book.png"),
            activeIcon: TabsIcon("assets/icon/book-active.png"),
          ),
          // BottomNavigationBarItem(
          //   title: Text('通知'),
          //   icon: TabsIcon("assets/icon/message.png"),
          //   activeIcon: TabsIcon("assets/icon/message-active.png"),
          // ),
          BottomNavigationBarItem(
            title: Text('购物车'),
            icon: TabsIcon(
              "assets/icon/shopcart-unactive.png",
              isShopCart: true,
            ),
            activeIcon: TabsIcon(
              "assets/icon/shopcart-active.png",
              isShopCart: true,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('我的'),
            icon: TabsIcon("assets/icon/myCenter.png"),
            activeIcon: TabsIcon("assets/icon/myCenter-active.png"),
          )
        ],
      ),
    );
  }
}
