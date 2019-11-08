import {StyleSheet} from 'react-native';

const style = StyleSheet.create({
  container: {
    height: 32,
    position: 'relative',
    borderRadius: 18,
    backgroundColor: '#fff',
    paddingHorizontal: global.gPadding.m,
    paddingVertical: 0,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  searchInput: {
    flexDirection: 'row',
    justifyContent: 'flex-start',
    alignItems: 'center',
  },
  search: {
    marginRight: global.gMargin.xs,
  },
  placeHolder: {
    color: global.gColors.fontLv3,
    ...global.gFontSize.Lv3,
  },
  searchBox: {
    flex: 1,
  },
});

export default style;
