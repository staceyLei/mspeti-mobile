import 'package:educationapp/route/route.dart' as router;
import 'package:educationapp/store/store.dart' as store;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:educationapp/store/store.dart';
import 'dart:io';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:educationapp/assets/style.dart' as style;

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/Welcome', //初始化的时候加载的路由
        onGenerateRoute: router.onGenerateRoute,
        theme: ThemeData(
          primaryColor: style.themeColor,
          accentColor: style.themeColor,
        ),
      ),
    );
  }
}
