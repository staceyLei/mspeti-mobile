import 'package:redux/redux.dart';
import 'reducer/index.dart';
import './modal/User.dart';

class MainState {
  User user;
  MainState({this.user});
  MainState.init() {
    this.user = User.init();
  }
}

var store = Store<MainState>(appReducer, initialState: MainState.init());
