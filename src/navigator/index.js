import {
  createStackNavigator,
  StackViewStyleInterpolator,
} from 'react-navigation-stack';
import {createAppContainer} from 'react-navigation';
import Welcome from 'containers/Welcome';
import LoginStack from './LoginStack';
import Main from './tabsNavigator';

const stackNavigation = createStackNavigator(
  {
    Welcome: {
      screen: Welcome,
      navigationOptions: {
        header: null,
      },
    },
    LoginStack: {
      screen: LoginStack,
      navigationOptions: {
        header: null,
      },
    },
    Main: {
      screen: Main,
      navigationOptions: {
        header: null,
      },
    },
  },
  {
    initialRouteName: 'Main',
    transitionConfig: () => () => ({
      // 设置安卓路由切换效果与ios一致
      screenInterpolator: StackViewStyleInterpolator.forHorizontal,
    }),
  },
);

export default createAppContainer(stackNavigation);
