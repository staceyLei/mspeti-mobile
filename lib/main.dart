import 'package:educationapp/provider/UserProvider.dart';
import 'package:educationapp/route/route.dart' as router;
import 'package:educationapp/store/store.dart' as store;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:educationapp/assets/style.dart' as style;
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:educationapp/provider/CourseListProvider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UserProvider(),),
      ChangeNotifierProvider(create: (_) => CourseListProvider()),
    ],
    child: MyApp(),
    )
    );
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

const Map<TargetPlatform, PageTransitionsBuilder> _defaultBuilders =
    <TargetPlatform, PageTransitionsBuilder>{
  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store.store,
      child: MaterialApp(
        navigatorKey: router.navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: '/Welcome', //初始化的时候加载的路由
        onGenerateRoute: router.onGenerateRoute,
        theme: ThemeData(
          primaryColor: style.themeColor,
          accentColor: style.themeColor,
          pageTransitionsTheme: PageTransitionsTheme(builders: _defaultBuilders),
        ),
      ),
    );
  }
}
