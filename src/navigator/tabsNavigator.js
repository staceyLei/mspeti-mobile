import {createBottomTabNavigator} from 'react-navigation-tabs';
import React from 'react';
import {Image, StyleSheet} from 'react-native';
import NavigationService from 'utils/navigationService';
import store from 'store/store';
import Badge from 'components/Badge';
import Icons from './const';
import HomePage from 'containers/HomePage';
import MyCenter from 'containers/MyCenter';
import Course from 'containers/Course';
import Message from 'containers/Message';

const renderIcon = (focused, source) => {
  const img = focused ? Icons[source][0] : Icons[source][1];
  if (source === 'shopCart') {
    return <Badge img={img} />;
  }
  return <Image source={img} />;
};
const tabsNavigator = createBottomTabNavigator(
  {
    HomePage: {
      screen: HomePage,
      navigationOptions: {
        tabBarLabel: '首页',
        tabBarIcon: ({focused}) => renderIcon(focused, 'home'),
      },
    },
    Course: {
      screen: Course,
      navigationOptions: {
        tabBarLabel: '课程',
        tabBarIcon: ({focused}) => renderIcon(focused, 'course'),
      },
    },
    Message: {
      screen: Message,
      navigationOptions: {
        tabBarLabel: '消息',
        tabBarIcon: ({focused}) => renderIcon(focused, 'message'),
      },
    },
    MyCenter: {
      screen: MyCenter,
      navigationOptions: {
        tabBarLabel: '我的',
        tabBarIcon: ({focused}) => renderIcon(focused, 'my'),
      },
    },
  },
  {
    tabBarOptions: {
      activeTintColor: global.gColors.primary,
      inactiveTintColor: '#1E1E1E',
      showIcon: true,
      style: {
        backgroundColor: '#fff',
        shadowColor: '#000',
        shadowOffset: {w: 0, h: -2},
        shadowOpacity: 0.1,
        shadowRadius: 6,
        elevation: 10, //设置此项Android显示阴影，只能是灰色阴影，不支持其他颜色设置
        height: 55,
        borderTopWidth: 0,
      },
      //tab bar的文本样式
      labelStyle: {
        fontSize: global.gFontSize.Lv4.fontSize,
        bottom: 5,
      },
      tabStyle: {
        borderColor: '#fff',
      },
    },
    backBehavior: 'none',
    initialRouteName: 'HomePage',
  },
);

export default tabsNavigator;
