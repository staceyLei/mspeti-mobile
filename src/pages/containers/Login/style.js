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
    marginTop: global.gMargin.l,
  },
  topBox: {
    width: global.gScreen.width,
    paddingHorizontal: global.gPadding.l + global.gPadding.xs,
  },
  inputBox: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: global.gPadding.m,
    borderBottomColor: '#F3F3F3',
    borderBottomWidth: 1,
    alignItems: 'center',
  },
  placeHolder: {
    ...global.gFontSize.Lv2,
    color: global.gColors.fontLv1,
  },
  localBox: {
    flexDirection: 'row',
    justifyContent: 'center',
  },
  localNum: {
    ...global.gFontSize.Lv2,
    color: global.gColors.fontLv1,
  },
  inputText: {
    ...global.gFontSize.Lv2,
    color: global.gColors.fontLv1,
    paddingVertical: 0,
    marginVertical: 0,
    flex: 1,
  },
  phoneNumBox: {
    paddingVertical: global.gPadding.m,
    borderBottomColor: '#F3F3F3',
    borderBottomWidth: 1,
  },
  getCodeBtn: {
    backgroundColor: global.gColors.primary,
    paddingVertical: global.gPadding.s,
    borderRadius: 25,
    marginTop: 2 * global.gMargin.l,
    marginBottom: global.gMargin.l,
    alignItems: 'center',
  },
  inActiveBtn: {
    backgroundColor: 'rgba(22,184,157,0.5);',
    paddingVertical: global.gPadding.s,
    borderRadius: 25,
    marginTop: 2 * global.gMargin.l,
    marginBottom: global.gMargin.l,
    alignItems: 'center',
  },
  codeText: {
    ...global.gFontSize.Lv1,
    color: '#FFFFFF',
  },
  loginOrRegister: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  pwdTips: {
    color: global.gColors.fontLv2,
    ...global.gFontSize.Lv3,
  },
  registerTips: {
    ...global.gFontSize.Lv3,
    color: global.gColors.primary,
  },
  bottomBox: {
    width: global.gScreen.width,
    paddingHorizontal: global.gMargin.l + global.gMargin.m,
  },
  tipsText: {
    color: global.gColors.fontLv3,
    ...global.gFontSize.Lv4,
  },
  iconContainer: {
    width: '100%',
    flexDirection: 'row',
    justifyContent: 'space-around',
    marginTop: 2 * global.gMargin.l,
  },
  iconBox: {
    justifyContent: 'center',
    alignItems: 'center',
  },
  waysIcon: {
    marginBottom: global.gMargin.s,
  },
  aggreeText: {
    flexDirection: 'row',
    marginVertical: global.gMargin.xl,
    justifyContent: 'center',
  },
  aggreement: {
    color: global.gColors.primary,
    ...global.gFontSize.Lv4,
  },
  bottomDivider: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
  },
  divider: {
    height: 1,
    flex: 1,
    backgroundColor: global.gColors.divider,
  },
  loginWaysText: {
    marginHorizontal: global.gMargin.s,
  },
  pwdLoginBox: {
    width: global.gScreen.width,
    paddingHorizontal: global.gPadding.l + global.gPadding.xs,
  },
  forgetPwd: {
    width: '100%',
    alignItems: 'flex-end',
  },
  graphCode: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    borderBottomColor: '#F3F3F3',
    borderBottomWidth: 1,
    alignItems: 'center',
  },
  codeInput: {
    ...global.gFontSize.Lv2,
    color: global.gColors.fontLv1,
    padding: 0,
    marginVertical: 0,
    paddingVertical: 15,
    width:
      (global.gScreen.width - (global.gPadding.l + global.gPadding.xs)) * 0.4,
  },
  codeBox: {
    flex: 1,
    // marginLeft: 10,
  },
  codePic: {
    width: 190,
    height: 2 * global.gPadding.m + global.gFontSize.Lv2.lineHeight,
  },
});
