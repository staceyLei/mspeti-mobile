import React, {useState, useEffect, useRef} from 'react';
import {View, Text, ImageBackground, TouchableOpacity} from 'react-native';
import style from './style';

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
      clearInterval(timer.current);
    }
  }, [time]);

  const handleJump = () => {
    clearInterval(timer.current);
    props.navigation.navigate('LoginStack');
  };

  return (
    <View style={style.container}>
      <ImageBackground
        source={require('assets/image/welcome.png')}
        resizeMode="stretch"
        style={style.bgImage}>
        <TouchableOpacity onPress={handleJump} style={style.timeBox}>
          <Text style={style.timeText}>跳过({time})</Text>
        </TouchableOpacity>
      </ImageBackground>
    </View>
  );
};

export default Welcome;
