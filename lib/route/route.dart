import 'package:educationapp/pages/container/ConfirmOrder/ConfirmOrder.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/pages/container/Tab/Tabs.dart';
import 'package:educationapp/pages/container/Login/Login.dart';
import 'package:educationapp/pages/container/SetUp/SetUp.dart';
import 'package:educationapp/pages/container/SMSCode/SMSCode.dart';
import 'package:educationapp/pages/container/Welcome/Welcome.dart';
import 'package:educationapp/pages/container/CourseDetails/CourseDetails.dart';
import 'package:educationapp/pages/container/CourseDetails/components/CommentDetail/CommentDetail.dart';

final routes = {
  '/': (context, {arguments}) => Tabs(),
  '/Login': (context, {arguments}) => Login(
        arguments: arguments,
      ),
  '/SMSCode': (context, {arguments}) => SMSCode(
        arguments: arguments,
      ),
  '/Welcome': (context) => Welcome(),
  '/SetUp': (context) => SetUp(),
  '/CourseDetails': (context, {arguments}) => CourseDetails(arguments: arguments,),
  '/CourseComment':(context,{arguments}) => CommentDetail(),
  '/ConfirmOrder':(context,{arguments}) => ConfirmOrder(),
};

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      print('arguments:${settings.arguments}');
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments),
              );
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
