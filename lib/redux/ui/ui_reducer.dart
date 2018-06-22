import 'package:flutter_redux_starter/redux/ui/ui_actions.dart';
import 'package:flutter_redux_starter/redux/ui/ui_state.dart';
import 'package:redux/redux.dart';

UIState uiReducer(UIState state, action) {

  return state.rebuild((b) => b
    ..currentRoute = currentRouteReducer(state.currentRoute, action)
  );
}

Reducer<String> currentRouteReducer = combineReducers([
  TypedReducer<String, UpdateCurrentRoute>(updateCurrentRouteReducer),
]);

String updateCurrentRouteReducer(String currentRoute, UpdateCurrentRoute action) {
  return action.route;
}
