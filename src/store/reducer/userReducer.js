import { GET_USER_INFO } from '../types';

const initialState = {
  isLogin: false,
  userInfo: {},
};

export default (state = initialState, action) => {
  switch (action.type) {
    case GET_USER_INFO:
      return {
        ...state,
        userInfo:action.payload,
      }
    default:return state
  }
}