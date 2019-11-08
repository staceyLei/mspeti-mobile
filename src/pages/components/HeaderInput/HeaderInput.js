import React, {useState, useEffect} from 'react';
import {Text, View, Image, TouchableOpacity} from 'react-native';
import style from './style';

const HeaderInput = props => {
  const {searchImg, speechImg, styles, onPress, placeHolder} = props;

  return (
    <View style={[style.container, styles]}>
      <TouchableOpacity
        style={style.searchBox}
        activeOpacity={1}
        onPress={onPress}>
        <View style={style.searchInput}>
          <Image style={style.search} source={searchImg} />
          <Text style={style.placeHolder}>{placeHolder}</Text>
        </View>
      </TouchableOpacity>
      <Image style={style.speech} source={speechImg} />
    </View>
  );
};
export default HeaderInput;
