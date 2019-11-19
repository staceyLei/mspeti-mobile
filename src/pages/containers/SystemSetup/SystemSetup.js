import React, {useState, useEffect, useRef} from 'react';
import {
  View,
  Text,
  StatusBar,
  TextInput,
  TouchableOpacity,
  Alert,
  Image,
} from 'react-native';
import Header from 'components/Header';
import style from './style';
import {connect} from 'react-redux';
import Toast from 'react-native-root-toast';
import api from 'services';
import userActions from 'store/actions/userActions';

const SystemSetup = props => {
  const handleExit = () => {
    props.toLogout().then(res => {
      if (res === '200') {
        props.navigation.navigate('LoginStack');
      }
    });
  };

  return (
    <View style={style.container}>
      <StatusBar
        translucent={true}
        barStyle="light-content"
        backgroundColor="rgba(0,0,0,0)"
      />
      <Header
        title="设置"
        titleProps={{style: style.title}}
        leftIcon={{image: require('assets/icon/arrow-left-white.png')}}
        rightIcon={require('assets/image/blank.png')}
        styles={style.header}
        leftIconAction={() => props.navigation.goBack()}
      />
      <View style={style.menuBox}>
        <TouchableOpacity style={style.menuItem} onPress={handleExit}>
          <View style={style.itemBox}>
            <Image source={require('assets/icon/back-exit.png')} />
            <Text style={style.itemText}>退出登录</Text>
          </View>
          <Image source={require('assets/icon/arrow-right-black.png')} />
        </TouchableOpacity>
      </View>
    </View>
  );
};
export default connect(
  state => ({...state.user}),
  {...userActions},
)(SystemSetup);
