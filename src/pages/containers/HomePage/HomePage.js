import React, {Component} from 'react';
import {
  View,
  FlatList,
  Text,
  Image,
  ScrollView,
  StatusBar,
  TouchableOpacity,
} from 'react-native';
import {connect} from 'react-redux';
import Swiper from 'react-native-swiper';
import style from './style';
import Header from 'components/Header';

class HomePage extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {
    this._navListener = this.props.navigation.addListener('willFocus', () => {
      StatusBar.setBarStyle('dark-content');
    });
  }

  static getDerivedStateFromProps(props, state) {
    if (props.isLogin) {
      props.getShopCartList();
    }
    return null;
  }

  componentWillUnmount() {
    this._navListener.remove();
  }

  render() {
    return (
      <View style={style.container}>
        <StatusBar
          barStyle="dark-content"
          backgroundColor="rgba(0,0,0,0)"
          translucent={true} //设置安卓状态栏不占位
        />
        <Header />
        <View style={{alignItems: 'center'}}>
          <Text>HomePage</Text>
        </View>
      </View>
    );
  }
}

export default HomePage;
