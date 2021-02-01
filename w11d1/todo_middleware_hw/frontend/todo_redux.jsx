import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// Phase 1: Logging
// const addLoggingToDispatch = store => {
//   let newDispatch = store.dispatch;

//   return function(action) {
//     console.log(store.getState());
//     console.log(action);
//     newDispatch(action);
//     console.log(store.getState());
//   }
// }

// Phase 2: Refactoring
// const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState());
//   console.log(action);
//   next(action);
//   console.log(store.getState());
// };

// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;

//   middlewares.forEach(middleware => {
//     dispatch = middleware(store)(dispatch);
//   });

//   return Object.assign({}, store, { dispatch })
// }

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  // Phase 1: Logging
  // store.dispatch = addLoggingToDispatch(store);

  // Phase 2: Refactoring
  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
