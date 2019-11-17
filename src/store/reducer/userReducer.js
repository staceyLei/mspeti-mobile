import {GET_USER_INFO, LOGIN_SUCCESS} from '../types';

const initialState = {
  isLogin: false,
  userInfo: {},
};

export default (state = initialState, action) => {
  switch (action.type) {
    case GET_USER_INFO:
      return {
        ...state,
        userInfo: action.payload,
      };
    case LOGIN_SUCCESS:
      return {
        ...initialState,
        isLogin: action.payload,
      };
    default:
      return state;
  }
};
