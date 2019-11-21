import {GET_USER_INFO, LOGIN_SUCCESS, LOGOUT_SUCCESS} from '../types';
import api from 'services';
import AsyncStorage from '@react-native-community/async-storage';

const userActions = {
  login: params => dispatch => {
    return api
      .login(params)
      .then(res => {
        if (res.access_token) {
          AsyncStorage.setItem('access_token', res.access_token);
        }
        dispatch({
          type: LOGIN_SUCCESS,
          payload: true,
        });
      })
      .catch(e => {
        console.log('e', e);
      });
  },
  toLogout: params => dispatch => {
    return new Promise((resolve, reject) => {
      resolve('200');
      dispatch({
        type: LOGOUT_SUCCESS,
        payload: false,
      });
    });
  },
};
export default userActions;
