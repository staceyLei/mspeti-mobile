import React, {useState, useEffect} from 'react';
import {
  View,
  Text,
  TextInput,
  StatusBar,
  Image,
  TouchableOpacity,
  Picker,
  ScrollView,
  Modal,
} from 'react-native';
import style from './style';
import HeaderTitle from 'components/HeaderTitle';
import ServiceAgreement from 'components/ServiceAgreement';

const Register = props => {
  const [disable, setDisable] = useState(true);
  const [phone, setPhone] = useState('');
  const [isShow, setIsShow] = useState(true);

  useEffect(() => {}, []);

  useEffect(() => {
    if (phone.length === 11) {
      setDisable(false);
    } else {
      setDisable(true);
    }
  }, [phone]);
  const handleChangeText = text => {
    setPhone(text);
  };

  useEffect(() => {
    if (phone.length === 11) {
      setDisable(false);
    } else {
      setDisable(true);
    }
  }, [phone]);

  const handleGetCode = () => {
    props.navigation.navigate('SMSAuth', {type: 2, param: {phone}}); //2 为注册 0 验证码登录 1 密码登录
  };

  const handleClean = () => {
    setPhone('');
  };

  const handleClose = () => {
    setIsShow('false');
  };

  const handleCancel = () => {
    setIsShow('false');
    props.navigation.goBack();
  };

  return (
    <View style={style.container}>
      <StatusBar
        backgroundColor="rgba(0,0,0,0)"
        translucent={true}
        barStyle="dark-content"
      />
      <HeaderTitle
        title="注册"
        leftIcon={require('assets/icon/arrow-left.png')}
        leftClick={props.navigation.goBack}
      />
      <View style={style.contentBox}>
        <View style={style.inputBox}>
          <View style={style.inputContent}>
            <TouchableOpacity style={style.picker}>
              <View style={style.pickerContent}>
                <Text style={style.pickerText}>+86</Text>
                <Image
                  source={require('assets/icon/arrow-down.png')}
                  style={style.selectDown}
                />
              </View>
            </TouchableOpacity>
            <TextInput
              style={style.inputText}
              placeholder="请输入手机号码"
              value={phone}
              onChangeText={handleChangeText}
              placeholderTextColor={global.gColors.fontLv3}
              maxLength={11}
              keyboardType="number-pad"
            />
          </View>
          {!phone ? null : (
            <TouchableOpacity onPress={handleClean}>
              <Image source={require('assets/icon/circle-cancel.png')} />
            </TouchableOpacity>
          )}
        </View>
        <TouchableOpacity
          style={disable ? style.inActiveBtn : style.getCodeBtn}
          activeOpacity={disable ? 1 : 0.5}
          onPress={handleGetCode}>
          <Text style={style.registerText}>获取验证码</Text>
        </TouchableOpacity>
        <TouchableOpacity style={style.mail}>
          <Text style={style.mailText}>邮箱注册</Text>
        </TouchableOpacity>
      </View>
      <ServiceAgreement
        handleCancel={handleCancel}
        isShow={isShow}
        handleClose={handleClose}
        sourceFrom="REGISTER"
        title="注册协议"
      />
    </View>
  );
};

export default Register;
