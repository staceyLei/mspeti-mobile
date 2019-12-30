import 'package:educationapp/store/type.dart';
import 'package:educationapp/store/store.dart';
import 'package:educationapp/store/viewModel/Action.dart';
import 'package:educationapp/store/modal/User.dart';
import 'package:dio/dio.dart';

class UserAction {
  static toLogin(loginType, params) async {
    try {
      Options options =
          Options(headers: {"Authorization": "Basic YXBwOmFwcA=="});
      if (loginType == 1) {
        var parameter = [];
        params.forEach((key, value) {
          parameter.add('$key=$value');
        });
        params = parameter.join('&');
        var url = 'http://47.101.141.240:8762/auth/oauth/token?$params';
        print('url:$url');
        Response res = await Dio().post(url, options: options);
        print(res);
      }
      store.dispatch(Action(
          type: Type.LOGIN_SUCCESS,
          payload: User(
            name: 'lili',
          )));
    } catch (e) {
      print(e);
    }
  }

  static toLogOut() {
    //清除token....
    store.dispatch(Action(
      type: Type.LOGIN_OUT_SUCCESS,
    ));

  }
}
