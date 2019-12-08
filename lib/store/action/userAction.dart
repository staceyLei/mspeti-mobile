import 'package:educationapp/store/reducer/userReducer.dart';
import 'package:educationapp/store/type.dart';
import 'package:educationapp/store/store.dart';
import 'package:educationapp/store/viewModel/Action.dart';

class UserAction {
  static toLogin(loginType, params) {
    store.dispatch(Action(
      type: Type.LOGIN_SUCCESS,
      payload: User(
        name: 'lili',
      )
    ));
  }
}
