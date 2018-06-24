import 'package:flutter_redux_starter/redux/app/app_actions.dart';
import 'package:flutter_redux_starter/redux/app/app_state.dart';
import 'package:flutter_redux_starter/redux/app/data_reducer.dart';
import 'package:flutter_redux_starter/redux/auth/auth_actions.dart';
import 'package:flutter_redux_starter/redux/auth/auth_reducer.dart';
import 'package:flutter_redux_starter/redux/ui/ui_reducer.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
  if (action is UserLogout) {
    return AppState().rebuild((b) => b.authState.replace(state.authState));
  } else if (action is LoadStateSuccess) {
    return action.state.rebuild((b) => b.isLoading = false);
  }

  return state.rebuild((b) => b
    ..isLoading = loadingReducer(state.isLoading, action)
    ..uiState.replace(uiReducer(state.uiState, action))
    ..authState.replace(authReducer(state.authState, action))
    ..dataState.replace(dataReducer(state.dataState, action))
  );
}

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, StartLoading>(_setLoading),
  TypedReducer<bool, StopLoading>(_setLoaded),
]);

bool _setLoading(bool state, action) {
  return true;
}

bool _setLoaded(bool state, action) {
  return false;
}


