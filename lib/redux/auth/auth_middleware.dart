import 'package:flutter/material.dart';
import 'package:flutter_redux_starter/data/repositories/auth_repository.dart';
import 'package:flutter_redux_starter/redux/app/app_state.dart';
import 'package:flutter_redux_starter/redux/auth/auth_actions.dart';
import 'package:flutter_redux_starter/ui/auth/login_vm.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Middleware<AppState>> createStoreAuthMiddleware([
  AuthRepository repository = const AuthRepository(),
]) {
  final loginInit = _createLoginInit();
  final loginRequest = _createLoginRequest(repository);

  return [
    TypedMiddleware<AppState, LoadUserLogin>(loginInit),
    TypedMiddleware<AppState, UserLoginRequest>(loginRequest),
  ];
}

_saveAuthLocal(action) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', action.email);
}

_loadAuthLocal(Store<AppState> store, action) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String email = prefs.getString('email');

  store.dispatch(UserLoginLoaded(email));
  Navigator.of(action.context).pushReplacementNamed(LoginScreen.route);
}

Middleware<AppState> _createLoginInit() {
  return (Store<AppState> store, action, NextDispatcher next) {
    _loadAuthLocal(store, action);

    next(action);
  };
}

Middleware<AppState> _createLoginRequest(AuthRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository
        .login(action.email, action.password, action.url, action.secret)
        .then((data) {
      _saveAuthLocal(action);

      store.dispatch(UserLoginSuccess());
      action.completer.complete(null);
    }).catchError((error) {
      print(error);
      store.dispatch(UserLoginFailure(error));
    });

    next(action);
  };
}
