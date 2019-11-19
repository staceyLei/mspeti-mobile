import {GET_USER_INFO, LOGIN_SUCCESS, LOGOUT_SUCCESS} from '../types';
import api from 'services';
import AsyncStorage from '@react-native-community/async-storage';

const userActions = {
  login: params => dispatch => {
    // dispatch({
    //   type: LOGIN_SUCCESS,
    //   payload: true,
    // });
    // return new Promise((resolve, reject) => {
    //   resolve('200');
    // });
    console.log('params', params);
    return api
      .login(params)
      .then(res => {
        console.log('res11', res);
        // dispatch({
        //   type: LOGIN_SUCCESS,
        //   payload: true,
        // });
        return res;
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
