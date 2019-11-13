import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: global.gScreen.navBarPaddingTop,
  },
  contentBox: {
    flex: 1,
    alignItems: 'flex-end',
    width: global.gScreen.width,
    paddingHorizontal: 25,
    paddingTop: 30,
  },
  registerText: {
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
    backgroundColor: 'rgba(37,102,177,0.5);',
    paddingVertical: 10,
    borderRadius: 25,
    marginTop: 40,
    marginBottom: 20,
    alignItems: 'center',
    width: '100%',
  },
  inputBox: {
    flexDirection: 'row',
    width: '100%',
    justifyContent: 'space-between',
    alignItems: 'center',
    borderBottomColor: '#F3F3F3',
    borderBottomWidth: 1,
    marginBottom: 15,
    paddingBottom: 15,
  },
  mailText: {
    ...global.gFontSize.Lv3,
    color: global.gColors.fontLv2,
  },
  inputText: {
    color: global.gColors.fontLv1,
    ...global.gFontSize.Lv2,
    paddingVertical: 0,
    marginVertical: 0,
    flex: 1,
  },
});
