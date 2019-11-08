import {StyleSheet} from 'react-native';

const style = StyleSheet.create({
  wrap: {
    width: '100%',
    flexDirection: 'row',
    alignItems: 'center',
    height: global.gScreen.navBarHeight - global.gScreen.navBarPaddingTop,
    paddingHorizontal: global.gPadding.s,
    position: 'relative',
  },
  text: {
    flex: 1,
    fontSize: 18,
    textAlign: 'center',
  },
  leftBtn: {
    position: 'absolute',
    left: global.gMargin.s,
    zIndex: 99,
  },
});

export default style;
