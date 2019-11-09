import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    paddingTop: global.gScreen.navBarPaddingTop,
  },
  contentBox: {
    flex: 1,
    justifyContent: 'space-between',
    marginTop: 35,
    alignItems: 'center',
  },
  topBox: {
    width: global.gScreen.width,
    paddingHorizontal: 25,
    alignItems: 'center',
  },
  SMSText: {
    ...global.gFontSize.Lv3,
    color: global.gColors.fontLv1,
    width: '100%',
  },
  loginText: {
    ...global.gFontSize.Lv1,
    fontWeight: '400',
    color: '#FFFFFF',
  },
  getCodeBtn: {
    backgroundColor: global.gColors.primary,
    paddingVertical: 10,
    borderRadius: 25,
    marginTop: 40,
    marginBottom: 20,
    alignItems: 'center',
    width: '100%',
  },
  inActiveBtn: {
    backgroundColor: 'rgba(22,184,157,0.5);',
    paddingVertical: 10,
    borderRadius: 25,
    marginTop: 40,
    marginBottom: 20,
    alignItems: 'center',
    width: '100%',
  },
  getCodeText: {
    ...global.gFontSize.Lv3,
    color: global.gColors.fontLv3,
  },
  bottomBox: {
    marginBottom: 40,
  },
  primaryText: {
    ...global.gFontSize.Lv3,
    color: global.gColors.primary,
  },
  inputBox: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    width: '100%',
    paddingHorizontal: global.gMargin.l,
    marginTop: global.gMargin.l,
  },
  inputLine: {
    borderBottomColor: '#CBCACF',
    borderBottomWidth: 1,
    paddingHorizontal: 5,
    minWidth: 32,
  },
  SMSInput: {
    position: 'absolute',
    width: '100%',
    height: '100%',
    zIndex: 999,
    fontSize: 32,
    padding: 0, //清除安卓默认padding，与IOS保持一致
    color: 'rgba(0,0,0,0)',
  },
  inputVal: {
    fontSize: 32,
    lineHeight: 45,
    fontWeight: 'bold',
  },
  inputHidden: {
    color: 'rgba(0,0,0,0)',
  },
  reGetCode: {
    flexDirection: 'row',
    justifyContent: 'center',
  },
  reGet: {
    ...global.gFontSize.Lv3,
    color: global.gColors.blue,
  },
});
