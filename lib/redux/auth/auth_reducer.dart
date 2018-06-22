import 'package:flutter_redux_starter/redux/auth/auth_actions.dart';
import 'package:flutter_redux_starter/redux/auth/auth_state.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, UserLoginLoaded>(userLoginLoadedReducer),
  TypedReducer<AuthState, UserLoginRequest>(userLoginRequestReducer),
  TypedReducer<AuthState, UserLoginSuccess>(userLoginSuccessReducer),
  TypedReducer<AuthState, UserLoginFailure>(userLoginFailureReducer),
]);

AuthState userLoginLoadedReducer(AuthState authState, UserLoginLoaded action) {
  return authState.rebuild((b) => b
    ..isInitialized = true
    ..email = action.email ?? '');
}

AuthState userLoginRequestReducer(
    AuthState authState, UserLoginRequest action) {
  return authState.rebuild((b) => b
    ..email = action.email
    ..password = action.password);
}

AuthState userLoginSuccessReducer(
    AuthState authState, UserLoginSuccess action) {
  return authState.rebuild((b) => b
    ..isAuthenticated = true
    ..password = '');
}

AuthState userLoginFailureReducer(
    AuthState authState, UserLoginFailure action) {
  return authState.rebuild((b) => b..error = action.error);
}
