import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  container: {
    width: global.gScreen.width,
    height: global.gScreen.height,
    backgroundColor: global.gColors.bgColor,
    flex: 1,
  },
  header: {
    backgroundColor: '#2D76CA',
    padding: 15,
  },
  menuBox: {
    backgroundColor: '#FFFFFF',
    marginHorizontal: 15,
    borderRadius: 8,
    paddingHorizontal: 10,
    marginTop: 10,
  },
  menuItem: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 20,
    paddingTop: 20,
    paddingHorizontal: 5,
  },
  itemBox: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  itemText: {
    ...global.gFontSize.Lv2,
    marginLeft: 10,
  },
  title: {
    ...global.gFontSize.Lv1,
    color: '#FFFFFF',
    fontWeight: 'bold',
  },
});
