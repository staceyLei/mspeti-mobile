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
    backgroundColor: 'rgba(22,184,157,0.5);',
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
    marginTop: 40,
    borderBottomColor: '#F3F3F3',
    borderBottomWidth: 1,
    paddingBottom: 15,
  },
  inputText: {
    color: global.gColors.fontLv1,
    ...global.gFontSize.Lv2,
    paddingVertical: 0,
    marginVertical: 0,
    flex: 1,
  },
  mailText: {
    ...global.gFontSize.Lv3,
    color: global.gColors.fontLv2,
  },
  inputContent: {
    flexDirection: 'row',
    justifyContent: 'flex-start',
    alignItems: 'center',
    flex: 1,
  },
  pickerContent: {
    flexDirection: 'row',
    justifyContent: 'flex-start',
    alignItems: 'center',
  },
  picker: {
    marginRight: 30,
  },
  pickerText: {
    color: global.gColors.fontLv1,
    ...global.gFontSize.Lv2,
  },
  selectDown: {
    width: 16,
    height: 16,
    marginLeft: 5,
  },
});
