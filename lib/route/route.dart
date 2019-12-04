import 'package:flutter/material.dart';
import '../pages/container/Tab/Tabs.dart';
import '../pages/container/Login/Login.dart';
import '../pages/container/SMSCode/SMSCode.dart';
import '../pages/container/Welcome/Welcome.dart';

final routes = {
  '/': (context,{arguments}) => Tabs(),
  '/Login': (context,{arguments}) => Login(arguments: arguments,),
  '/SMSCode': (context,{arguments}) => SMSCode(arguments: arguments,),
  '/Welcome': (context) => Welcome(),
};


//固定写法
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
