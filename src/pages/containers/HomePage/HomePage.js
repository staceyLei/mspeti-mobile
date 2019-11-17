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
import HeaderInput from 'components/HeaderInput';
import listData from './const';
import HotClassPanel from './components/HotClassPanel';
import userActions from '../../../store/actions/userActions';

class HomePage extends Component {
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
        return this.renderBannder(item.data);
      case 'menu':
        return this.renderMenuView(item.data);
      case 'hot':
        return this.renderHotClass(item.data);
      default:
        return null;
    }
  };

  renderHeadText = () => {
    const today = new Date();
    const hours = today.getHours();
    const day = today.getDay();
    const sayHello =
      hours < 12
        ? '上午好'
        : hours < 14
        ? '中午好'
        : hours < 18
        ? '下午好'
        : '晚上好';
    let week = '';
    switch (day) {
      case 0:
        week = '周日';
        break;
      case 1:
        week = '周一';
        break;
      case 2:
        week = '周二';
        break;
      case 3:
        week = '周三';
        break;
      case 4:
        week = '周四';
        break;
      case 5:
        week = '周伍';
        break;
      default:
        week = '周六';
    }
    return sayHello + '，今天是' + week;
  };

  renderBannder = imgs => {
    return (
      <View style={style.bannerWrap}>
        <View style={style.bannerBg}>
          <View style={style.header}>
            <Image
              style={style.headImg}
              source={require('assets/image/headImg.png')}
            />
            <Text style={style.headText}>小明，{this.renderHeadText()}</Text>
          </View>
        </View>
        <View style={style.bannerSwiper}>
          <Swiper
            autoplay={true}
            removeClippedSubviews={false}
            height={166}
            paginationStyle={style.paginationStyle}
            activeDotStyle={style.activeDotStyle}>
            {imgs.map((item, i) => (
              <Image
                source={item}
                key={i}
                resizeMode="stretch"
                style={style.bannerImg}
              />
            ))}
          </Swiper>
        </View>
      </View>
    );
  };

  renderHotClass = data => {
    return (
      <View style={style.hotWrap}>
        <View style={style.hotHead}>
          <View style={style.hotTit}>
            <Image source={require('assets/icon/title-bar.png')} />
            <Text style={style.titText}>热门课程</Text>
          </View>
          <TouchableOpacity>
            <View style={style.more}>
              <Text style={style.moreText}>查看更多</Text>
              <Image source={require('assets/icon/arrow-right-blue.png')} />
            </View>
          </TouchableOpacity>
        </View>
        {data.map((ele, i) => (
          <HotClassPanel {...ele} key={i} />
        ))}
      </View>
    );
  };

  renderMenuView = menus => {
    const menuArr = [...menus];
    const menuSwiper = [];
    while (menuArr.length) {
      menuSwiper.push(menuArr.splice(0, 4));
    }
    menuSwiper.forEach(ele => {
      if (ele.length < 4) {
        while (ele.length < 4) {
          ele.push({icon: require('assets/image/blank.png')});
        }
      }
    });
    return (
      <View style={style.menuSwiper}>
        <Swiper
          removeClippedSubviews={false}
          dotStyle={style.menuDot}
          activeDotStyle={style.menuActiveDot}
          paginationStyle={{bottom: 10}}
          height={100}>
          {menuSwiper.map((menu, i) => (
            <View style={style.menuBox} key={i}>
              {menu.map((ele, index) => (
                <TouchableOpacity key={index}>
                  <View style={style.menuItem} key={index}>
                    <Image source={ele.icon} style={style.menuImg} />
                    <Text style={style.menuText}>{ele.title}</Text>
                  </View>
                </TouchableOpacity>
              ))}
            </View>
          ))}
        </Swiper>
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
          style={style.headBox}
          ref={refs => (this.head = refs)}
          onLayout={this.handleLayout}>
          <Image
            style={style.headImg}
            source={require('assets/image/headImg.png')}
          />
          <View style={{flex: 1}}>
            <HeaderInput
              searchImg={require('assets/icon/search.png')}
              speechImg={require('assets/icon/speech.png')}
              placeHolder="我的成绩"
            />
          </View>
        </View>
        <FlatList
          renderItem={this.renderItem}
          keyExtractor={item => item.type}
          data={listData}
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
  {...userActions},
)(HomePage);
