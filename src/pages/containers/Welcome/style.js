import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  container: {
    width: global.gScreen.width,
    height: global.gScreen.height,
    backgroundColor: '#FFFFFF',
  },
  bgImage: {
    width: global.gScreen.width,
    height: global.gScreen.height,
  },
  timeBox: {
    paddingVertical: 10,
    paddingHorizontal: 30,
    borderRadius: 10,
    backgroundColor: 'rgba(37,102,177,0.5)',
  },
  timeText: {
    color: '#FFFFFF',
    ...global.gFontSize.Lv3,
  },
  timeWrap: {
    flexDirection: 'row',
    position: 'absolute',
    right: 20,
    bottom: global.gScreen.height * 0.2,
  },
});
