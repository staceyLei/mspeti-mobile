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

class Message extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {
    this._navListener = this.props.navigation.addListener('willFocus', () => {
      StatusBar.setBarStyle('light-content');
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
          barStyle="light-content"
          backgroundColor="rgba(0,0,0,0)"
          translucent={true} //设置安卓状态栏不占位
        />
        <View>
          <Text>Message</Text>
        </View>
      </View>
    );
  }
}

export default Message;
