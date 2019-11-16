import React from 'react';
import {connect} from 'react-redux';
import {StyleSheet, View, Image, Text} from 'react-native';

const Badge = props => {
  const {img} = props;
  const num = 0;
  return (
    <View>
      <Image source={img} />
      <View style={style.badge}>
        <Text style={style.num}>{num}</Text>
      </View>
    </View>
  );
};

const style = StyleSheet.create({
  badge: {
    backgroundColor: global.gColors.red,
    width: 14,
    height: 14,
    borderRadius: 7,
    position: 'absolute',
    right: -7,
    top: -4,
    justifyContent: 'center',
    alignItems: 'center',
  },
  num: {
    color: '#fff',
    fontSize: 11,
  },
});

export default Badge;
