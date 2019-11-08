import {StyleSheet, Platform} from 'react-native';

const style = StyleSheet.create({
  navigationBarContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    width: '100%',
    height: global.gScreen.navBarHeight,
    paddingTop: global.gScreen.navBarPaddingTop,
  },

  title: {
    fontSize: 18,
  },
  subTitle: {
    fontSize: 12,
    color: 'white',
    paddingVertical: 4,
  },
  icon: {
    padding: 10,
  },
  rightIcon2: {
    height: global.gIcon.size,
    width: global.gIcon.size,
    justifyContent: 'center',
    position: 'absolute',
    top: global.gScreen.navBarPaddingTop,
    right: global.gIcon.size,
  },
  rightIcon3: {
    height: global.gIcon.size,
    width: global.gIcon.size,
    justifyContent: 'center',
    position: 'absolute',
    top: global.gScreen.navBarPaddingTop,
    right: Platform.OS === 'ios' ? 88 : 100,
  },
  rightButton: {
    // position: 'absolute',
    // right: 10,
    // height: 44,
    // justifyContent: 'center',
    // flexDirection: 'row',
    // top: global.gScreen.navBarPaddingTop,
    padding: global.gPadding.s,
  },
  content: {
    alignItems: 'center',
  },
  text: {
    color: 'white',
    fontSize: 10,
    marginTop: 2,
  },
  buttonTitleFont: {
    // color: 'white',
    fontSize: 15,
  },
});

export default style;
