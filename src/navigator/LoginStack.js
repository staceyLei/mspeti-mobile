import {
  createStackNavigator,
  StackViewStyleInterpolator,
} from 'react-navigation-stack';
import Login from 'containers/Login';
import SMSAuth from 'containers/SMSAuth';
import Register from 'containers/Register';
import SetPassword from 'containers/SetPassword';

const LoginStack = createStackNavigator(
  {
    Login: {
      screen: Login,
    },
    SMSAuth: {
      screen: SMSAuth,
    },
    Register: {
      screen: Register,
    },
    SetPassword: {
      screen: SetPassword,
    },
  },
  {
    initialRouteName: 'Login',
    mode: 'modal',
    defaultNavigationOptions: {
      header: null,
    },
    transitionConfig: () => ({
      // 设置安卓路由切换效果与ios一致
      screenInterpolator: StackViewStyleInterpolator.forHorizontal,
    }),
  },
);

export default LoginStack;
