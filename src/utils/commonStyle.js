import {Dimensions, Platform, PixelRatio, StatusBar} from 'react-native';
const width = Dimensions.get('window').width;
const height = Dimensions.get('window').height;
const isIOS = Platform.OS === 'ios';
// iPhoneX xs 11pro
const X_width = 375;
const X_height = 812;
const isX =
  (height === X_height && width === X_width) ||
  (height === X_width && width === X_height);
//XR 11
const i11_width = 414;
const i11_height = 896;
const is11 =
  (height === i11_height && width === i11_width) ||
  (height === i11_width && width === i11_height);
const isNewIOS = Platform.OS === 'ios' && (isX || is11);

const navBarHeight = isNewIOS ? 88 : isIOS ? 64 : StatusBar.currentHeight + 44;
const navBarPaddingTop = isNewIOS ? 44 : isIOS ? 20 : StatusBar.currentHeight;

// 全局样式
global.gScreen = {
  width,
  height,
  isIOS,
  isNewIOS,
  navBarHeight,
  navBarPaddingTop,
  onePix: 1 / PixelRatio.get(),
};

global.gColors = {
  primary: '#16B89D',
  orange: '#FF892E',
  yellow: '#FFB63B',
  purple: '#616BFF',
  blue: '#2E82FF',
  red: '#FF483D',
  pink: '#F04880',

  fontLv1: '#323138',
  fontLv2: '#696970',
  fontLv3: '#9E9EA3',

  divider: '#E7E6EB',
  bgColor: '#F7F8FF',
};

global.gFontSize = {
  lgTitle: {
    fontWeight: '500',
    fontSize: 30,
    lineHeight: 34,
  },
  Lv1: {
    fontWeight: '500',
    fontSize: 18,
    lineHeight: 24,
  },
  Lv2: {
    fontSize: 16,
    lineHeight: 22,
  },
  Lv3: {
    fontSize: 14,
    lineHeight: 20,
  },
  Lv4: {
    fontSize: 12,
    lineHeight: 16,
  },
  Lv5: {
    fontSize: 10,
    lineHeight: 14,
  },
};

global.gIcon = {
  size: isIOS ? 44 : 50,
};

global.gPxs = {
  px_1: 1 / PixelRatio.get(),
  px_6: 6 / PixelRatio.get(),
  px_8: 8 / PixelRatio.get(),
  px_10: 10 / PixelRatio.get(),
  px_12: 12 / PixelRatio.get(),
  px_16: 16 / PixelRatio.get(),
  px_20: 20 / PixelRatio.get(),
  px_22: 22 / PixelRatio.get(),
  px_24: 24 / PixelRatio.get(),
  px_28: 28 / PixelRatio.get(),
  px_36: 36 / PixelRatio.get(),
  px_42: 42 / PixelRatio.get(),
  px_48: 48 / PixelRatio.get(),
  px_50: 50 / PixelRatio.get(),
  px_60: 60 / PixelRatio.get(),
  px_126: 126 / PixelRatio.get(),
  px_320: 320 / PixelRatio.get(),
};

global.gMargin = {
  xs: 5,
  s: 10,
  m: 15,
  l: 20,
  xl: 30,
};

global.gPadding = {
  xs: 5,
  s: 10,
  m: 15,
  l: 20,
  xl: 30,
};
