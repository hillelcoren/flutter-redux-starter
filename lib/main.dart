import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_starter/redux/app/app_middleware.dart';
import 'package:flutter_redux_starter/redux/app/app_state.dart';
import 'package:flutter_redux_starter/redux/app/app_reducer.dart';
import 'package:flutter_redux_starter/redux/auth/auth_actions.dart';
import 'package:flutter_redux_starter/redux/auth/auth_middleware.dart';
import 'package:flutter_redux_starter/ui/app/init.dart';
import 'package:flutter_redux_starter/ui/auth/login_vm.dart';
import 'package:flutter_redux_starter/ui/home/home_screen.dart';
// STARTER: import - do not remove comment

void main() {
  final store = Store<AppState>(appReducer,
      initialState: AppState(),
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
        title: 'Sample Redux App',
        routes: {
          InitScreen.route: (context) => InitScreen(),
          LoginScreen.route: (context) {
            return LoginScreen();
          },
          HomeScreen.route: (context) {
            return HomeScreen();
          },
          // STARTER: routes - do not remove comment
        },
      ),
    );
  }
}
