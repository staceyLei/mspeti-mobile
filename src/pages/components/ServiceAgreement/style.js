import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  modalContainer: {
    width: global.gScreen.width,
    height: '100%',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: 'rgba(0,0,0,0.3)',
  },
  aggreementWrap: {
    width: global.gScreen.width * 0.8,
    height: global.gScreen.height * 0.6,
    backgroundColor: '#FFFFFF',
    borderRadius: 4,
  },
  aggreementContent: {
    padding: 20,
  },
  content: {
    height:
      global.gScreen.height * 0.6 -
      (3 * global.gPadding.l + global.gPadding.m + 50),
  },
  headerTit: {
    textAlign: 'center',
    color: global.gColors.fontLv1,
    ...global.gFontSize.Lv2,
    marginBottom: global.gMargin.m,
  },
  contentContainer: {
    width: '100%',
  },
  aggreeText: {
    color: global.gColors.fontLv2,
    ...global.gFontSize.Lv3,
    lineHeight: 20,
  },
  aggreeBtn: {
    flexDirection: 'row',
    borderTopColor: global.gColors.divider,
    borderTopWidth: 1,
    flex: 1,
  },
  btn: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  border: {
    borderRightWidth: 1,
    borderRightColor: global.gColors.divider,
  },
  cancel: {
    color: global.gColors.fontLv3,
    ...global.gFontSize.Lv2,
  },
  ok: {
    color: global.gColors.primary,
    ...global.gFontSize.Lv2,
  },
});
