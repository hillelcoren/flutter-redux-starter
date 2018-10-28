import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterreduxrad/constants.dart';

import 'package:flutterreduxrad/redux/app/app_middleware.dart';
import 'package:flutterreduxrad/redux/app/app_state.dart';
import 'package:flutterreduxrad/redux/app/app_reducer.dart';
import 'package:flutterreduxrad/redux/auth/auth_middleware.dart';
import 'package:flutterreduxrad/ui/app/init.dart';
import 'package:flutterreduxrad/ui/auth/login_vm.dart';
import 'package:flutterreduxrad/ui/home/home_screen.dart';
// STARTER: import - do not remove comment


void main() async {
  final prefs = await SharedPreferences.getInstance();
  final enableDarkMode = prefs.getBool(kSharedPrefEnableDarkMode);

  final store = Store<AppState>(appReducer,
      initialState: AppState(enableDarkMode: enableDarkMode),
      middleware: []
        ..addAll(createStoreAuthMiddleware())
        ..addAll(createStorePersistenceMiddleware())
        // STARTER: middleware - do not remove comment

        ..addAll([
          LoggingMiddleware.printer(),
        ]));

  runApp(SampleReduxApp(store: store));
}

class SampleReduxApp extends StatefulWidget {
  final Store<AppState> store;

  SampleReduxApp({Key key, this.store}) : super(key: key);

  @override
  _SampleReduxAppState createState() => _SampleReduxAppState();
}

class _SampleReduxAppState extends State<SampleReduxApp> {

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'Sample App',
        routes: {
          InitScreen.route: (context) => InitScreen(),
          LoginScreen.route: (context) => LoginScreen(),
          HomeScreen.route: (context) => HomeScreen(),
          // STARTER: routes - do not remove comment

        },
      ),
    );
  }
}
