import React from 'react';
import {View, Text, Image, TouchableOpacity} from 'react-native';
import style from './style';

const HeaderTitle = props => {
  const {leftClick, leftIcon, title, styles} = props;

  const onLeftClick = () => {
    if (leftClick) {
      leftClick();
    }
  };
  return (
    <View style={[style.wrap, styles]}>
      {props.leftIcon && (
        <TouchableOpacity
          activeOpacity={1}
          style={style.leftBtn}
          onPress={onLeftClick}>
          <Image source={leftIcon} />
        </TouchableOpacity>
      )}
      <Text style={[style.text, props.styles]}>{title}</Text>
    </View>
  );
};

export default HeaderTitle;
