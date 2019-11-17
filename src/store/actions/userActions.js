import {GET_USER_INFO, LOGIN_SUCCESS} from '../types';
import api from 'services';
import AsyncStorage from '@react-native-community/async-storage';

const userActions = {
  login: params => dispatch => {
    console.log('params', params);
    return api
      .login(params)
      .then(res => {
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
};
export default userActions;
