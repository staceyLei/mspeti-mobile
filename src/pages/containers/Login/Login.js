import React, {useState, useEffect} from 'react';
import {
  View,
  Text,
  StatusBar,
  TextInput,
  TouchableOpacity,
  Image,
  Modal,
  ScrollView,
} from 'react-native';
import {connect} from 'react-redux';
import HeaderTitle from 'components/HeaderTitle';
import NavigationService from 'utils/navigationService';
import style from './style';
import userActions from 'store/actions/userActions';
import api from 'services';

const Icons = [
  {title: '微信', img: require('assets/icon/wechat.png')},
  {title: 'QQ', img: require('assets/icon/QQ.png')},
];
const Login = props => {
  const [disable, setDisabale] = useState(true);
  const [phone, setPhone] = useState('');
  const [userName, setUserName] = useState('');
  const [password, setPassword] = useState('');
  const [loginWays, setLoginWays] = useState(0); //0 验证码 1 密码
  const [graphCode, setGraphCode] = useState('');
  const [saw, setIsSaw] = useState(false);

  useEffect(() => {
    if (loginWays === 0) {
      //验证码登录时
      if (phone.length === 11) {
        setDisabale(false);
      } else {
        setDisabale(true);
      }
    } else {
      //密码登陆时
      // const able = [userName, password, graphCode].every(
      //   ele => ele.length !== 0,
      // );
      const able = [userName, password].every(ele => ele.length !== 0);
      setDisabale(!able);
    }
  }, [phone, loginWays, userName, password, graphCode]);

  const renderLoginWays = data =>
    data.map((item, i) => (
      <TouchableOpacity style={style.iconBox} key={i}>
        <Image source={item.img} style={style.waysIcon} />
        <Text style={style.tipsText}>{item.title}</Text>
      </TouchableOpacity>
    ));

  const handleChangeText = (type, text) => {
    switch (type) {
      case 'phone':
        setPhone(text);
        break;
      case 'pwd':
        setPassword(text);
        break;
      case 'userName':
        setUserName(text);
        break;
      case 'graphCode':
        setGraphCode(text);
        break;
      default:
        null;
    }
  };

  const handleGetCode = () => {
    const oldP = props.navigation.state.params;
    props.navigation.navigate('SMSAuth', {
      type: loginWays,
      param: {phone},
      ...oldP,
    });
  };

  const handleClean = () => {
    if (loginWays === 0) {
      setPhone('');
    } else {
      setPassword('');
    }
  };

  const handlePwdLogin = () => {
    setDisabale(true);
    setLoginWays(1);
  };

  const handleRegister = () => {
    props.navigation.navigate('Register');
  };

  const handleLogin = () => {
    const params = {
      // graphValidateCode: graphCode,
      username: userName,
      grant_type: 'password',
      password,
    };
    setDisabale(true);
    props.login(params).then(res => {
      setDisabale(false);
      // if (res === '200') {
      //   const {from, fromParam} = props.navigation.state.params;
      //   if (from) {
      //     props.navigation.navigate(from, fromParam);
      //   } else {
      //     props.navigation.navigate('Main');
      //   }
      // } else {
      //   // handleChangeCode();
      // }
    });
  };

  // const handleChangeCode = () => {
  //   const uri = `http://172.21.72.8:8830${
  //     api.getGraphValidateCode
  //   }?v=${Math.random()}`;
  //   setCodeUri(uri);
  // };

  const renderCodeLogin = () => (
    <>
      <View style={style.topBox}>
        <View style={style.titleBox}>
          <Text style={style.titText}>手机免密登录</Text>
          <Text style={style.tipText}>HI 欢迎登录</Text>
        </View>
        <View style={style.inputBox}>
          <TextInput
            style={style.inputText}
            placeholder="请输入手机号"
            value={phone}
            keyboardType="phone-pad"
            placeholderTextColor={global.gColors.fontLv3}
            onChangeText={text => handleChangeText('phone', text)}
            maxLength={11}
          />
          {phone.length === 0 ? null : (
            <TouchableOpacity onPress={handleClean}>
              <Image source={require('assets/icon/circle-cancel.png')} />
            </TouchableOpacity>
          )}
        </View>
        <TouchableOpacity
          style={disable ? style.inActiveBtn : style.getCodeBtn}
          activeOpacity={disable ? 1 : 0.5}
          onPress={disable ? null : handleGetCode}>
          <Text style={style.codeText}>获取验证码</Text>
        </TouchableOpacity>
      </View>
      <View style={style.bottomBox}>
        <Text style={style.wayText}>其他登录方式</Text>
        <View style={style.iconContainer}>{renderLoginWays(Icons)}</View>
      </View>
    </>
  );
  const renderPwdLogin = () => (
    <View style={style.pwdLoginBox}>
      <Text style={style.titText}>手机、账号、邮箱登录</Text>
      <ScrollView keyboardShouldPersistTaps="handled">
        <View style={style.inputBox}>
          <TextInput
            style={style.inputText}
            placeholder="请输入手机/账号/邮箱"
            value={userName}
            placeholderTextColor={global.gColors.fontLv3}
            onChangeText={text => handleChangeText('userName', text)}
          />
        </View>
        <View style={style.inputBox}>
          <View style={style.pwdCtl}>
            <TouchableOpacity
              style={style.eye}
              onPress={() => setIsSaw(pre => !pre)}>
              <Image
                source={
                  saw
                    ? require('assets/icon/eye-open.png')
                    : require('assets/icon/eye-close.png')
                }
              />
            </TouchableOpacity>
            <TextInput
              placeholder="请输入密码"
              value={password}
              onChangeText={text => handleChangeText('pwd', text)}
              style={style.inputText}
              placeholderTextColor={global.gColors.fontLv3}
              secureTextEntry={!saw} //隐藏输入内容
            />
          </View>
          {!password.length ? null : (
            <TouchableOpacity onPress={handleClean}>
              <Image source={require('assets/icon/circle-cancel.png')} />
            </TouchableOpacity>
          )}
        </View>
      </ScrollView>
      <TouchableOpacity
        style={disable ? style.inActiveBtn : style.getCodeBtn}
        activeOpacity={disable ? 1 : 0.5}
        onPress={disable ? null : handleLogin}>
        <Text style={style.codeText}>登录</Text>
      </TouchableOpacity>
      <View style={style.forgetPwd}>
        <TouchableOpacity onPress={handleRegister}>
          <Text style={style.pwdTips}>忘记密码</Text>
        </TouchableOpacity>
      </View>
    </View>
  );

  const toCodeLogin = () => {
    setLoginWays(0);
  };

  return (
    <View style={style.container}>
      <StatusBar
        backgroundColor="rgba(0,0,0,0)"
        translucent={true}
        barStyle="dark-content"
      />
      <View style={style.head}>
        <Image source={require('assets/icon/arrow-left-black.png')} />
        <TouchableOpacity
          onPress={loginWays === 0 ? handlePwdLogin : toCodeLogin}>
          <Text style={style.headText}>
            {loginWays === 0 ? '密码登录' : '免密登录'}
          </Text>
        </TouchableOpacity>
      </View>
      <View style={style.contentBox}>
        {loginWays === 0 ? renderCodeLogin() : renderPwdLogin()}
      </View>
    </View>
  );
};

export default connect(
  state => ({...state.user}),
  userActions,
)(Login);
