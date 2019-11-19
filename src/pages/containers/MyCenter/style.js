import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  container: {
    width: global.gScreen.width,
    height: global.gScreen.height,
    backgroundColor: global.gColors.bgColor,
    flex: 1,
  },
  headWrap: {
    overflow: 'hidden',
  },
  contentContainer: {
    paddingBottom: 10,
  },
  headerBg: {
    width: global.gScreen.width,
    paddingTop: global.gScreen.navBarPaddingTop,
    height: 230,
    paddingHorizontal: 15,
    paddingBottom: 15,
    position: 'absolute',
  },
  bgCircle: {
    position: 'absolute',
    right: 25,
    bottom: 50,
  },
  headCtl: {
    alignItems: 'flex-end',
  },
  perInfo: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: 30,
  },
  headBox: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  headImg: {
    width: 65,
    height: 65,
    borderRadius: 65 / 2,
  },
  headInfoBox: {
    marginLeft: 10,
  },
  name: {
    fontWeight: 'bold',
    fontSize: 20,
    lineHeight: 30,
    color: '#FFFFFF',
  },
  honor: {
    flexDirection: 'row',
    backgroundColor: '#FF9F22',
    paddingHorizontal: 5,
    borderRadius: 3,
    alignItems: 'center',
  },
  honorNum: {
    marginLeft: 5,
    fontSize: 11,
    lineHeight: 15,
    color: '#FFFFFF',
  },
  infoBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingRight: 20,
  },
  messageText: {
    ...global.gFontSize.Lv3,
    color: '#FFFFFF',
    marginRight: 5,
  },
  menuBox: {
    backgroundColor: '#FFFFFF',
    marginHorizontal: 15,
    borderRadius: 8,
    paddingHorizontal: 10,
  },
  menuItem: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 20,
    paddingTop: 20,
    paddingHorizontal: 5,
    borderBottomColor: global.gColors.bgColor,
    borderBottomWidth: 1,
    paddingBottom: 10,
  },
  itemBox: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  itemText: {
    ...global.gFontSize.Lv2,
    marginLeft: 10,
  },
  headerPanelBox: {
    width: global.gScreen.width - 2 * global.gMargin.m,
    marginHorizontal: global.gMargin.m,
    alignItems: 'center',
    marginTop: 230 - 50,
    marginBottom: 15,
  },
  topPanel: {
    paddingHorizontal: 10,
    paddingVertical: 10,
    backgroundColor: '#25B187',
    borderTopLeftRadius: 10,
    borderTopRightRadius: 10,
    flexDirection: 'row',
    justifyContent: 'space-between',
    width: global.gScreen.width * 0.65,
  },
  pointBox: {
    flexDirection: 'row',
  },
  topText: {
    marginRight: 5,
    ...global.gFontSize.Lv3,
    color: '#FFFFFF',
  },
  bottomPanel: {
    width: '100%',
    backgroundColor: '#FFFFFF',
    borderRadius: 10,
    elevation: 4,
    paddingHorizontal: 15,
    paddingVertical: 10,
  },
  bottomTit: {
    ...global.gFontSize.Lv2,
    fontWeight: 'bold',
  },
  learnWrap: {
    marginTop: 20,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
  },
  learnBox: {
    alignItems: 'center',
  },
  divider: {
    width: 3,
    height: 20,
    backgroundColor: '#2B88F4',
    marginHorizontal: 15,
  },
  learnTit: {
    ...global.gFontSize.Lv4,
  },
  learnData: {
    fontWeight: 'bold',
    fontSize: 20,
    lineHeight: 27,
    color: '#2B88F4',
  },
  headBarWrap: {
    position: 'absolute',
    zIndex: 0,
    opacity: 0,
    backgroundColor: '#2D76CA',
  },
  headBar: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    width: global.gScreen.width,
    paddingHorizontal: 10,
    paddingBottom: 10,
    position: 'relative',
    paddingTop: global.gScreen.navBarPaddingTop,
  },
  headBarCircle: {
    position: 'absolute',
    bottom: 0,
    right: 0,
  },
  smallHead: {
    width: 32,
    height: 32,
    borderRadius: 32 / 2,
  },
  setupBtn: {
    paddingVertical: 10,
  },
  headTit: {
    ...global.gFontSize.Lv1,
    color: '#FFFFFF',
  },
});
