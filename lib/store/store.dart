import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'reducer/index.dart';
import 'reducer/userReducer.dart';

class MainState {
  User user;
  MainState({this.user});
  MainState.init() {
    this.user = User.init();
  }
}

var store = Store<MainState>(appReducer, initialState: MainState.init());
