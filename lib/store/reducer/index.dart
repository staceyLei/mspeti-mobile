import 'package:educationapp/store/reducer/userReducer.dart';
import 'package:educationapp/store/store.dart';

MainState appReducer(MainState state,action){
  return MainState(
    user: userReducer(state.user,action),
  );
}
