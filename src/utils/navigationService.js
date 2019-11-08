import {NavigationActions} from 'react-navigation';

let _navigator;
// ref传值
const setTopLevelNavigator = navigatorRef => {
  _navigator = navigatorRef;
};

const navigate = (routeName, params) => {
  _navigator.dispatch(
    NavigationActions.navigate({
      routeName,
      params,
    }),
  );
};

const getCurrentRoute = () => {
  let route = _navigator.state.nav;
  while (route.routes) {
    route = route.routes[route.index];
  }
  return route;
};

const goBack = () => {
  _navigator.dispatch(NavigationActions.back());
};

const setParam = (params, routeName) => {
  _navigator.dispatch(NavigationActions.setParams({params, key: routeName}));
};

export default {
  navigate,
  setTopLevelNavigator,
  getCurrentRoute,
  goBack,
  setParam,
};
