import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux_starter/redux/app/app_actions.dart';
import 'package:flutter_redux_starter/redux/app/app_state.dart';

class LoadStateRequest {
  final BuildContext context;
  LoadStateRequest(this.context);
}
class LoadStateSuccess {
  final AppState state;
  LoadStateSuccess(this.state);
}

class LoadUserLogin {
  final BuildContext context;
  LoadUserLogin(this.context);
}

class UserLoginLoaded {
  final String email;

  UserLoginLoaded(this.email);
}

class UserLoginRequest implements StartLoading {
  final Completer completer;
  final String email;
  final String password;

  UserLoginRequest(this.completer, this.email, this.password);
}

class UserLoginSuccess implements StopLoading {}

class UserLoginFailure implements StopLoading {
  final String error;

  UserLoginFailure(this.error);
}

class UserLogout implements PersistData {}

