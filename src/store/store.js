import {createStore, applyMiddleware, compose} from 'redux';
import thunk from 'redux-thunk';
import rootReducer from './reducer';

const initialState = {};
const middleWare = [thunk];
const enhancers = [];

const store = createStore(
  rootReducer,
  initialState,
  compose(
    applyMiddleware(...middleWare),
    ...enhancers,
  ),
);

export default store;
