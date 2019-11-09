import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  container: {
    width: global.gScreen.width,
    height: global.gScreen.height,
  },
  bgImage: {
    width: '100%',
    height: '100%',
  },
  timeBox: {
    paddingVertical: 10,
    paddingHorizontal: 30,
    borderRadius: 10,
    backgroundColor: 'rgba(0,0,0,0.2)',
  },
  timeText: {
    color: '#FFFFFF',
    ...global.gFontSize.Lv3,
  },
  timeWrap: {
    flexDirection: 'row',
    position: 'absolute',
    justifyContent: 'flex-end',
    right: 0,
    bottom: 30,
  },
});
