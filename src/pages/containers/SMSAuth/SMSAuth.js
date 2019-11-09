import React, {useState, useEffect, useRef} from 'react';
import {
  View,
  Text,
  StatusBar,
  TextInput,
  TouchableOpacity,
  Alert,
} from 'react-native';
import HeaderTitle from 'components/HeaderTitle';
import style from './style';
import {connect} from 'react-redux';
import Toast from 'react-native-root-toast';
import api from 'services';
import userActions from 'store/actions/userActions';

const SMSAuth = props => {
  const [disable, setDisable] = useState(true);
  const [SMScode, setSMScode] = useState('');
  const [authCode, setAuthCode] = useState('');
  const [time, setTime] = useState(60);
  const [timeOut, setTimeOut] = useState(false);
  const timer = useRef();
  const {type, param} = props.navigation.state.params; //type: 2为注册

  useEffect(() => {
    getVeriCode();
  }, []);// eslint-disable-line

  const getVeriCode = () => {
    const {phone} = param;
    api
      .getVerificationCode({
        busiType: '3',
        receviNo: phone,
        sendType: '1',
      })
      .then(res => {
        setAuthCode(res);
        Alert.alert('验证码为', res, [{text: '确认'}], {cancelable: false});
      });
  };

  useEffect(() => {
    timer.current = setInterval(() => {
      setTime(count => count - 1);
    }, 1000);
    return () => {
      clearInterval(timer.current);
    };
  }, []);

  useEffect(() => {
    if (time === 0) {
      setTimeOut(true);
      clearInterval(timer.current);
    }
  }, [time]);

  useEffect(() => {
    if (SMScode.length === 6) {
      setDisable(false);
    } else {
      setDisable(true);
    }
  }, [SMScode]);

  const handleReGetCode = () => {
    setTime(60);
    setTimeOut(false);
    getVeriCode();
    timer.current = setInterval(() => {
      setTime(count => count - 1);
    }, 1000);
  };

  const handleChangeCode = code => {
    setSMScode(code);
  };

  const renderInputBox = code => {
    const codeArr = code.split('');
    let inputArr = [];
    inputArr = codeArr.map((item, i) => (
      <View style={style.inputLine} key={i}>
        <Text style={style.inputVal}>{item}</Text>
      </View>
    ));
    const emptyView = i => (
      <View style={style.inputLine} key={i}>
        <Text style={[style.inputVal, style.inputHidden]}>0</Text>
      </View>
    );
    while (inputArr.length < 6) {
      inputArr.push(emptyView(12 - inputArr.length));
    }
    return inputArr;
  };

  const handleRegisterNext = () => {
    const {phone} = param;
    if (SMScode === authCode) {
      props.navigation.navigate('SetPassword', {
        param: {mobile: phone, randomCode: SMScode},
      });
    } else {
      Toast.show('验证码错误', {
        duration: 1000,
        position: Toast.positions.CENTER,
        shadow: false,
      });
    }
  };

  const handleLogin = () => {
    const {phone} = param;
    props
      .login({
        loginType: '2',
        mobile: phone,
        password: SMScode,
      })
      .then(res => {
        if (res === '200') {
          const oldP = props.navigation.state.params;
          if (oldP && oldP.from) {
            props.navigation.navigate(oldP.from, {...oldP});
          } else {
            props.navigation.navigate('Main');
          }
        }
      });
  };

  const getPhoneNum = phone => {
    const phoneNum = phone.split('').map((val, i) => {
      if (i >= 3 && i <= 6) {
        return '*';
      }
      return val;
    });
    return phoneNum.join('');
  };

  return (
    <View style={style.container}>
      <StatusBar
        backgroundColor="rgba(0,0,0,0)"
        translucent={true}
        barStyle="dark-content"
      />
      <HeaderTitle
        title="短信验证码"
        leftIcon={require('assets/icon/arrow-left.png')}
        leftClick={props.navigation.goBack}
      />
      <View style={style.contentBox}>
        <View style={style.topBox}>
          <Text style={style.SMSText}>
            验证码将发送到手机号{getPhoneNum(param.phone)}
          </Text>
          <View>
            <TextInput
              style={style.SMSInput}
              onChangeText={handleChangeCode}
              keyboardType="number-pad"
              maxLength={6}
              value={SMScode}
              caretHidden={true}
              autoFocus
            />
            <View style={style.inputBox}>{renderInputBox(SMScode)}</View>
          </View>
          <TouchableOpacity
            style={disable ? style.inActiveBtn : style.getCodeBtn}
            activeOpacity={disable ? 1 : 0.5}
            onPress={type === 2 ? handleRegisterNext : handleLogin}>
            <Text style={style.loginText}>
              {type === 2 ? '下一步' : '登录'}
            </Text>
          </TouchableOpacity>
          {!timeOut ? (
            <Text style={style.getCodeText}>{time}s后重新获取</Text>
          ) : (
            <View style={style.reGetCode}>
              <Text style={style.getCodeText}>没有收到短信验证码？</Text>
              <TouchableOpacity
                style={style.reGetBtn}
                onPress={handleReGetCode}>
                <Text style={style.reGet}>重新获取</Text>
              </TouchableOpacity>
            </View>
          )}
        </View>
        <TouchableOpacity activeOpacity={1} style={style.bottomBox}>
          <Text style={style.primaryText}>收不到验证码？</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
};

export default connect(
  state => state.user,
  userActions,
)(SMSAuth);
