import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_starter/redux/app/app_state.dart';
import 'package:flutter_redux_starter/redux/auth/auth_actions.dart';
import 'package:flutter_redux_starter/redux/auth/auth_state.dart';
import 'package:flutter_redux_starter/ui/auth/login.dart';
import 'package:redux/redux.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  static final String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, LoginVM>(
        converter: LoginVM.fromStore,
        builder: (context, vm) {
          return LoginView(
            viewModel: vm,
          );
        },
      ),
    );
  }
}

class LoginVM {
  bool isLoading;
  AuthState authState;
  final Function(BuildContext, String, String) onLoginPressed;

  LoginVM({
    @required this.isLoading,
    @required this.authState,
    @required this.onLoginPressed,
  });

  static LoginVM fromStore(Store<AppState> store) {
    return LoginVM(
        isLoading: store.state.isLoading,
        authState: store.state.authState,
        onLoginPressed: (BuildContext context, String email, String password) {
          if (store.state.isLoading) {
            return;
          }
          final Completer<Null> completer = new Completer<Null>();
          store.dispatch(UserLoginRequest(
              completer, email.trim(), password.trim()));
          completer.future.then((_) {
            //Navigator.of(context).pushReplacementNamed(DashboardScreen.route);
            //store.dispatch(UpdateCurrentRoute(DashboardScreen.route));
          });
        });
  }
}
