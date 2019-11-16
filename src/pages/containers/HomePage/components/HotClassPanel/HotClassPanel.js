import React, {useEffect, useState} from 'react';
import {View, Text, TouchableOpacity, Image} from 'react-native';
import style from './style';

const HotClassPanel = props => {
  const {imgUrl, name, content} = props;

  return (
    <View style={style.container}>
      <View style={style.imgBox}>
        <Image source={imgUrl} style={style.img} />
      </View>
      <View style={style.contentBox}>
        <View>
          <Text style={style.title}>{name}</Text>
          <Text style={style.content}>{content}</Text>
        </View>
        <View style={style.moreBtn}>
          <TouchableOpacity>
            <View style={style.more}>
              <Text style={style.moreText}>了解更多</Text>
              <Image source={require('assets/icon/arrow-right-blue.png')} />
            </View>
          </TouchableOpacity>
        </View>
      </View>
    </View>
  );
};

export default HotClassPanel;
