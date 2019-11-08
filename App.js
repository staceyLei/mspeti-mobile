import React, {Component} from 'react';
import {Provider, connect} from 'react-redux';
import {BackHandler, ToastAndroid} from 'react-native';
import AsyncStorage from '@react-native-community/async-storage';
import commonStyle from 'utils/commonStyle'; // 入口文件引入全局样式
import store from 'store/store';
import NavigationService from 'utils/navigationService';
import userActions from 'store/actions/userActions';
import {setCustomText} from 'react-native-global-props';
import Navigator from './src/navigator';
import api from 'services';

class InitApp extends Component {
  componentDidMount() {
    BackHandler.addEventListener('hardwareBackPress', this.onBackHandler);
  }
  componentWillUnmount() {
    BackHandler.removeEventListener('hardwareBackPress', this.onBackHandler);
  }

  onBackHandler = () => {
    const currentRoute = NavigationService.getCurrentRoute();
    if (currentRoute !== 'HomePage') {
      NavigationService.navigate('HomePage');
    } else {
      if (this.lastPressTime + 2000 > Date.now()) {
        BackHandler.exitApp();
        return false;
      }
      this.lastPressTime = Date.now();
      ToastAndroid.show('再按一次退出应用', 1000);
      return true;
    }
  };

  render() {
    return (
      <Provider store={store}>
        <Navigator
          ref={navigationRef => {
            NavigationService.setTopLevelNavigator(navigationRef);
          }}
        />
      </Provider>
    );
  }
}

const CApp = connect(
  state => ({
    user: state.user,
  }),
  {
    ...userActions,
  },
)(InitApp);

export default class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <CApp />
      </Provider>
    );
  }
}
