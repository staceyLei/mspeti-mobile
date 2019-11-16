import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  container: {
    width: global.gScreen.width,
    height: global.gScreen.height,
    backgroundColor: global.gColors.bgColor,
    flex: 1,
  },
  headBox: {
    opacity: 0,
    position: 'absolute',
    backgroundColor: '#25B187',
    paddingBottom: 5,
    paddingHorizontal: 10,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    elevation: 3,
    paddingTop: global.gScreen.navBarPaddingTop,
  },
  bannerWrap: {
    height: global.gScreen.navBarPaddingTop + 56 + global.gMargin.s + 166,
  },
  bannerBg: {
    top: 0,
    left: 0,
    backgroundColor: '#25B187',
    width: global.gScreen.width,
    height: 200,
    borderBottomLeftRadius: 30,
    borderBottomRightRadius: 30,
    paddingTop: global.gScreen.navBarPaddingTop,
    paddingHorizontal: 15,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  headImg: {
    width: 56,
    height: 56,
    borderRadius: 28,
    marginRight: 15,
  },
  headText: {
    ...global.gFontSize.Lv2,
    textShadowColor: 'rgba(0,0,0,0.1)',
    textShadowOffset: {width: 0, height: 6},
    color: '#FFFFFF',
    fontWeight: 'bold',
    textShadowRadius: 10,
  },
  bannerSwiper: {
    position: 'absolute',
    width: global.gScreen.width,
    paddingHorizontal: 15,
    top: global.gScreen.navBarPaddingTop + 56 + global.gMargin.s,
    overflow: 'hidden',
  },
  bannerImg: {
    height: '100%',
    width: '100%',
    borderRadius: 4,
  },
  paginationStyle: {
    bottom: 6,
  },
  activeDotStyle: {
    backgroundColor: '#FFFFFF',
    elevation: 3,
  },
  menuSwiper: {
    marginTop: 10,
    paddingHorizontal: 10,
  },
  menuBox: {
    flexDirection: 'row',
    justifyContent: 'space-around',
  },
  menuItem: {
    alignItems: 'center',
  },
  menuText: {
    fontSize: 12,
    color: '#9E9EA3',
    lineHeight: 16,
    marginTop: 5,
  },
  menuDot: {
    height: 3,
    width: 8,
    marginRight: -4,
  },
  menuActiveDot: {
    height: 3,
    width: 8,
    marginRight: -4,
    backgroundColor: '#696970',
  },
  hotWrap: {
    width: global.gScreen.width - 2 * global.gMargin.m,
    borderRadius: 4,
    backgroundColor: '#FFFFFF',
    marginHorizontal: 15,
    padding: 10,
  },
  hotHead: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 10,
  },
  hotTit: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  titText: {
    marginLeft: 10,
    ...global.gFontSize.Lv3,
    fontWeight: 'bold',
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
  contentContainer: {
    paddingBottom: 15,
  },
});
