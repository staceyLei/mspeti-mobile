import 'package:educationapp/pages/container/ConfirmOrder/ConfirmOrder.dart';
import 'package:flutter/material.dart';
import 'package:educationapp/pages/container/Tab/Tabs.dart';
import 'package:educationapp/pages/container/Login/Login.dart';
import 'package:educationapp/pages/container/SetUp/SetUp.dart';
import 'package:educationapp/pages/container/SMSCode/SMSCode.dart';
import 'package:educationapp/pages/container/Welcome/Welcome.dart';
import 'package:educationapp/pages/container/CourseDetails/CourseDetails.dart';
import 'package:educationapp/pages/container/CourseDetails/components/CommentDetail/CommentDetail.dart';
import 'package:educationapp/pages/container/ConfirmPay/ConfirmPay.dart';
import 'package:educationapp/pages/container/SelectSchool/SelectSchool.dart';
import 'package:educationapp/pages/container/UserInfo/UserInfo.dart';
import 'package:educationapp/pages/container/UserInfo/component/EditInfo.dart';
import 'package:educationapp/pages/container/CourseList/CourseList.dart';
import 'package:educationapp/pages/container/Collection/Collection.dart';
import 'package:educationapp/pages/container/SearchPage/SearchPage.dart';
import 'package:educationapp/pages/container/CollectionSearch/CollectionSearch.dart';
import 'package:educationapp/pages/container/Homework/Homework.dart';
import 'package:educationapp/pages/container/Homework/component/HomeworkDetail.dart';
import 'package:educationapp/pages/container/GrowUp/GrowUp.dart';
import 'package:educationapp/pages/container/GrowUp/component/NewGrowUp.dart';
import 'package:educationapp/pages/container/Comment/Comment.dart';
import 'package:educationapp/pages/container/Comment/component/AddComment.dart';
import 'package:educationapp/pages/container/MyCourse/MyCourse.dart';
import 'package:educationapp/pages/container/MyCourse/component/CourseContent.dart';
import 'package:educationapp/pages/container/TimeTable/TimeTable.dart';

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
  '/ConfirmPay':(context,{arguments}) => ConfirmPay(),
  '/SelectSchool':(context,{arguments}) => SelectSchool(),
  '/UserInfo':(context,{arguments}) => UserInfo(),
  '/EditInfo':(context,{arguments}) => EditInfo(arguments: arguments,),
  '/CourseList':(context,{arguments}) => CourseList(),
  '/Collection':(context,{arguments}) => Collection(),
  '/SearchPage':(context,{arguments}) => SearchPage(),
  '/CollectionSearch':(context,{arguments}) => CollectionSearch(),
  '/Homework':(context,{arguments}) => Homework(),
  '/GrowUp':(context,{arguments}) => GrowUp(),
  '/NewGrowUp':(context,{arguments}) => NewGrowUp(arguments: arguments,),
  '/HomeworkDetail':(context,{arguments}) => HomeworkDetail(arguments:arguments),
  '/AddComment':(context,{arguments}) => AddComment(arguments:arguments),
  '/Comment':(context,{arguments}) => Comment(),
  '/MyCourse':(context,{arguments}) => MyCourse(),
  '/TimeTable':(context,{arguments}) => TimeTable(),
  '/CourseContent':(context,{arguments}) => CourseContent(arguments:arguments),
};

// 代表当前context的路由对象
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
