import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  container: {
    width: '100%',
    padding: 10,
    backgroundColor: '#FFFFFF',
    elevation: 4,
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 10,
  },
  imgBox: {
    width:
      (global.gScreen.width - 2 * global.gMargin.m - 2 * global.gMargin.s) *
      0.33,
    height:
      (global.gScreen.width - 2 * global.gMargin.m - 2 * global.gMargin.s) *
      0.33,
    borderWidth: 1,
    borderColor: '#707070',
  },
  img: {
    width: '100%',
    height: '100%',
  },
  contentBox: {
    justifyContent: 'space-between',
  },
  title: {
    ...global.gFontSize.Lv2,
    color: '#000000',
    marginBottom: 5,
  },
  moreBtn: {
    alignItems: 'flex-end',
  },
  content: {
    ...global.gFontSize.Lv3,
    color: global.gColors.fontLv3,
  },
  more: {
    alignItems: 'center',
    flexDirection: 'row',
  },
  moreText: {
    ...global.gFontSize.Lv4,
    color: '#2B88F4',
    marginRight: 5,
  },
});
