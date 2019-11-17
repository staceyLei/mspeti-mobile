import React, {useState, useEffect, useRef} from 'react';
import {
  View,
  Text,
  ImageBackground,
  TouchableOpacity,
  StatusBar,
} from 'react-native';
import style from './style';
import {connect} from 'react-redux';

const Welcome = props => {
  const [time, setTime] = useState(3);
  const timer = useRef(null);

  useEffect(() => {
    timer.current = setInterval(() => {
      setTime(pre => pre - 1);
    }, 1000);
    return () => {
      clearInterval(timer.current);
    };
  }, []);

  useEffect(() => {
    if (time <= 0) {
      handleJump();
    }
  }, [time]); // eslint-disable-line

  const handleJump = () => {
    clearInterval(timer.current);
    if (!props.isLogin) {
      props.navigation.navigate('LoginStack', {from: 'HomePage'});
      return;
    }
    props.navigation.navigate('Main');
  };

  return (
    <View style={style.container}>
      <StatusBar
        translucent={true}
        backgroundColor="rgba(0,0,0,0)"
        barStyle="dark-content"
      />
      <ImageBackground
        source={require('assets/image/welcome.png')}
        // resizeMode="center"
        style={style.bgImage}>
        <TouchableOpacity onPress={handleJump} style={style.timeWrap}>
          <View style={style.timeBox}>
            <Text style={style.timeText}>跳过({time})</Text>
          </View>
        </TouchableOpacity>
      </ImageBackground>
    </View>
  );
};

export default connect(state => ({...state.user}))(Welcome);
