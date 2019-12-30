import '../type.dart';
import '../modal/User.dart';

User userReducer(state, action) {
  switch (action.type) {
    case Type.LOGIN_SUCCESS:
      return User(name: action.payload.name, isLogin: true);
      break;
    case Type.LOGIN_OUT_SUCCESS:
      return User.init();
      break;
    default:
      return state;
  }
}
