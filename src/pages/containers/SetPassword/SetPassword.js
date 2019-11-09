import React, {useState, useEffect} from 'react';
import {
  View,
  Text,
  TextInput,
  StatusBar,
  Image,
  TouchableOpacity,
  Keyboard,
} from 'react-native';
import Toast from 'react-native-root-toast';
import style from './style';
import HeaderTitle from 'components/HeaderTitle';
import api from 'services';

const SetPassword = props => {
  const [disable, setDisable] = useState(true);
  const [confirmPwd, setConfrimPwd] = useState('');
  const [seeSet, setSeeSet] = useState(false); //控制设置密码可见
  const [confirm, setConfirm] = useState(false); //控制确认密码可见
  const [pwd, setPwd] = useState('');

  useEffect(() => {
    setDisable(!(!!pwd && !!confirmPwd));
  }, [pwd, confirmPwd]);

  const handleChangeText = (text, type) => {
    switch (type) {
      case 'pwd':
        setPwd(text);
        break;
      case 'confirmPwd':
        setConfrimPwd(text);
        break;
      default:
        null;
    }
  };

  const validateParam = () => {
    const error = [];
    const reg = /^(?![a-zA-z]+$)(?!\d+$)(?![^\w\s]+$)[a-zA-Z\d!,@#$%^&.+=\-`*~]+$/;
    if (pwd !== confirmPwd) {
      error.push('两次输入的密码不一致');
    }
    if (pwd.length < 8) {
      error.push('密码必须为8-16位间');
    }
    if (!pwd.match(reg)) {
      error.push('请使用字母数字或符号的组合密码');
    }
    return error;
  };

  const handleRegister = () => {
    Keyboard.dismiss();
    const param = props.navigation.getParam('param');
    const {mobile, randomCode} = param;
    const params = {
      mobile,
      randomCode,
      password: pwd,
      registerType: 2,
    };
    const isCorrect = validateParam();
    if (!isCorrect.length) {
      setDisable(true);
      api.memberRegister(params).then(res => {
        setDisable(false);
        Toast.show('注册成功', {
          duration: 1000,
          position: Toast.positions.CENTER,
          shadow: false,
        });
        props.navigation.navigate('Login');
      });
    } else {
      const error = isCorrect.join(' ');
      Toast.show(error, {
        duration: 2000,
        position: Toast.positions.BOTTOM,
        shadow: false,
      });
    }
  };

  const handleSee = type => {
    switch (type) {
      case 'seeSet':
        setSeeSet(pre => !pre);
        break;
      case 'confirm':
        setConfirm(pre => !pre);
        break;
      default:
        null;
    }
  };

  return (
    <View style={style.container}>
      <StatusBar
        backgroundColor="rgba(0,0,0,0)"
        translucent={true}
        barStyle="dark-content"
      />
      <HeaderTitle
        title="设置密码"
        leftIcon={require('assets/icon/arrow-left.png')}
        leftClick={props.navigation.goBack}
      />
      <View style={style.contentBox}>
        <View style={style.inputBox}>
          <TextInput
            style={style.inputText}
            placeholder="请设置密码"
            secureTextEntry={!seeSet}
            value={pwd}
            placeholderTextColor={global.gColors.fontLv3}
            onChangeText={text => handleChangeText(text, 'pwd')}
            maxLength={16}
          />
          <TouchableOpacity onPress={() => handleSee('seeSet')}>
            <Image
              source={
                seeSet
                  ? require('assets/icon/pwd-eye-open.png')
                  : require('assets/icon/pwd-eye-close.png')
              }
            />
          </TouchableOpacity>
        </View>
        <View style={style.inputBox}>
          <TextInput
            style={style.inputText}
            placeholder="请确认密码"
            secureTextEntry={!confirm}
            value={confirmPwd}
            onChangeText={text => handleChangeText(text, 'confirmPwd')}
            placeholderTextColor={global.gColors.fontLv3}
            maxLength={16}
          />
          <TouchableOpacity onPress={() => handleSee('confirm')}>
            <Image
              source={
                confirm
                  ? require('assets/icon/pwd-eye-open.png')
                  : require('assets/icon/pwd-eye-close.png')
              }
            />
          </TouchableOpacity>
        </View>
        <View style={style.pwsTips}>
          <Text style={style.pwsTipsText}>
            密码长度为8-16位，必须包含至少两个或更多的数字、字母和符号组合
          </Text>
        </View>
        <TouchableOpacity
          style={disable ? style.inActiveBtn : style.getCodeBtn}
          activeOpacity={disable ? 1 : 0.5}
          onPress={disable ? null : handleRegister}>
          <Text style={style.registerText}>确认提交</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
};

export default SetPassword;
