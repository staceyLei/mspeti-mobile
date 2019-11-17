import React, {Component} from 'react';
import {
  View,
  FlatList,
  Text,
  Image,
  ScrollView,
  StatusBar,
  TouchableOpacity,
  ImageBackground,
} from 'react-native';
import {connect} from 'react-redux';
import Swiper from 'react-native-swiper';
import style from './style';
import listData from './const';
import userActions from 'store/actions/userActions';

class MyCenter extends Component {
  constructor(props) {
    super(props);
    this.state = {
      headHeight: 0,
    };
  }

  componentDidMount() {
    this._navListener = this.props.navigation.addListener('willFocus', () => {
      StatusBar.setBarStyle('light-content');
    });
  }

  componentWillUnmount() {
    this._navListener.remove();
  }

  handleLayout = ({nativeEvent}) => {
    const {height} = nativeEvent.layout;
    if (this.state.headHeight === 0) {
      this.setState({
        headHeight: height,
      });
    }
  };

  renderItem = ({item}) => {
    switch (item.type) {
      case 'banner':
        return this.renderHeaderView();
      case 'menu':
        return this.renderMenuView(item.data);
      default:
        return null;
    }
  };

  renderMenuView = menus => {
    return (
      <View style={style.menuBox}>
        {menus.map((item, i) => (
          <TouchableOpacity style={style.menuItem}>
            <View style={style.itemBox}>
              <Image source={item.icon} />
              <Text style={style.itemText}>{item.title}</Text>
            </View>
            <Image source={require('assets/icon/arrow-right-black.png')} />
          </TouchableOpacity>
        ))}
      </View>
    );
  };

  renderHeaderView = () => {
    return (
      <View style={style.headWrap}>
        <ImageBackground
          source={require('assets/icon/center-bg.png')}
          style={style.headerBg}>
          <Image
            style={style.bgCircle}
            source={require('assets/icon/circle-bg.png')}
          />
          <TouchableOpacity style={style.headCtl}>
            <Image source={require('assets/icon/icon-setup.png')} />
          </TouchableOpacity>
          <View style={style.perInfo}>
            <View style={style.headBox}>
              <Image
                style={style.headImg}
                source={require('assets/image/headImg.png')}
              />
              <View style={style.headInfoBox}>
                <Text style={style.name}>小明</Text>
                <View style={style.honor}>
                  <Image source={require('assets/icon/icon-xunzhang.png')} />
                  <Text style={style.honorNum}>0勋章</Text>
                </View>
              </View>
            </View>
            <TouchableOpacity>
              <View style={style.infoBtn}>
                <Text style={style.messageText}>我的资料卡</Text>
                <Image source={require('assets/icon/arrow-right-white.png')} />
              </View>
            </TouchableOpacity>
          </View>
        </ImageBackground>
        {this.renderHeadPanel()}
      </View>
    );
  };

  renderHeadPanel = () => {
    return (
      <View>
        <View style={style.headerPanelBox}>
          <View style={style.topPanel}>
            <Text style={style.topText}>等级Lv0</Text>
            <TouchableOpacity>
              <View style={style.pointBox}>
                <Text style={style.topText}>我的积分 1000</Text>
                <Image source={require('assets/icon/arrow-right-circle.png')} />
              </View>
            </TouchableOpacity>
          </View>
          <View style={style.bottomPanel}>
            <Text style={style.bottomTit}>我的学习数据</Text>
            <View style={style.learnWrap}>
              <View style={style.learnBox}>
                <Text style={style.learnTit}>学习时长(分钟)</Text>
                <Text style={style.learnData}>100</Text>
              </View>
              <View style={style.divider} />
              <View style={style.learnBox}>
                <Text style={style.learnTit}>课程数量</Text>
                <Text style={style.learnData}>5</Text>
              </View>
              <View style={style.divider} />
              <View style={style.learnBox}>
                <Text style={style.learnTit}>个人成绩</Text>
                <Text style={style.learnData}>A</Text>
              </View>
            </View>
          </View>
        </View>
      </View>
    );
  };

  handleOnScroll = e => {
    const {nativeEvent} = e;
    const {y} = nativeEvent.contentOffset;
    const percent = y / (2 * this.state.headHeight);
    this.head.setNativeProps({
      opacity: percent,
    });
  };

  render() {
    return (
      <View style={style.container}>
        <StatusBar
          barStyle="light-content"
          backgroundColor="rgba(0,0,0,0)"
          translucent={true} //设置安卓状态栏不占位
        />
        <View
          style={style.headBarWrap}
          ref={refs => (this.head = refs)}
          onLayout={this.handleLayout}>
          <Image
            style={style.headBarCircle}
            source={require('assets/icon/circle-bg.png')}
          />
          <View style={style.headBar}>
            <Image
              style={style.smallHead}
              source={require('assets/image/headImg.png')}
            />
            <Text style={style.headTit}>我的</Text>
            <TouchableOpacity style={style.headCtl}>
              <Image source={require('assets/icon/icon-setup.png')} />
            </TouchableOpacity>
          </View>
        </View>
        <FlatList
          renderItem={this.renderItem}
          data={listData}
          keyExtractor={item => item.type}
          showsVerticalScrollIndicator={false}
          style={style.content}
          onScroll={this.handleOnScroll}
          contentContainerStyle={style.contentContainer}
        />
      </View>
    );
  }
}

export default connect(
  state => ({...state.user}),
  {
    ...userActions,
  },
)(MyCenter);
