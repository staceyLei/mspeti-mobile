import {
  createStackNavigator,
  StackViewStyleInterpolator,
} from 'react-navigation-stack';
import {createAppContainer} from 'react-navigation';
import Welcome from 'container/Welcome';
import LoginStack from './LoginStack';

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
  },
  {
    initialRouteName: 'Welcome',
    transitionConfig: () => () => ({
      // 设置安卓路由切换效果与ios一致
      screenInterpolator: StackViewStyleInterpolator.forHorizontal,
    }),
  },
);

export default createAppContainer(stackNavigation);
